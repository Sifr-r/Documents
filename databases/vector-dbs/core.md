# Vector Database Core Concepts

## Embeddings

An embedding is an array (vector) of floating-point numbers that represents the semantic meaning of text, images, or audio. 

```python
# Example: Using OpenAI to get an embedding
from openai import OpenAI
client = OpenAI()

response = client.embeddings.create(
    input="What is a vector database?",
    model="text-embedding-ada-002"
)
vector = response.data[0].embedding  # e.g. [0.012, -0.003, 0.045, ...]
```

## Distance Metrics

Vector databases find similar items by calculating the "distance" between vectors:

1. **Cosine Similarity**: Measures the angle between two vectors (often used for NLP). Values range from -1 (opposite) to 1 (identical).
2. **Euclidean Distance (L2)**: Measures the straight-line distance between two points in vector space.
3. **Dot Product**: Multiplies corresponding components of two vectors and sums them up.

## Indexing Algorithms

Since comparing a query against *all* vectors in a database is slow, vector databases use approximate nearest neighbor (ANN) search algorithms:

*   **HNSW (Hierarchical Navigable Small World)**: A multi-layered graph approach. It's fast and accurate, making it the default in many vector DBs (Chroma, Pinecone, Qdrant).
*   **IVF (Inverted File Index)**: Groups vectors into clusters (Voronoi cells). The search only checks the clusters closest to the query.
*   **PQ (Product Quantization)**: Compresses vectors to save memory, at a slight cost to accuracy.

## Retrieval-Augmented Generation (RAG)

The most common use-case for vector databases with LLMs.

```python
# Pseudo-code for RAG
# 1. User asks a question
query = "How do I reset my password?"
query_vector = embed(query)

# 2. Search vector DB for similar documents
similar_docs = vector_db.query(vector=query_vector, top_k=3)

# 3. Provide context to the LLM
context = "\n".join([doc.text for doc in similar_docs])
prompt = f"Answer the user's question using only this context: {context}\n\nQuestion: {query}"

# 4. Generate answer
answer = llm.generate(prompt)
```

## See Also

*   [databases.md](../../concepts/databases.md) — General database patterns
