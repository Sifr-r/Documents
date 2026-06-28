# Fringe Cases

## Security Notes

Access to the [on-device speech recognition](/en-US/docs/Web/API/Web_Speech_API/Using_the_Web_Speech_API#on-device_speech_recognition) functionality of the Web Speech API is controlled by the {{httpheader("Permissions-Policy/on-device-speech-recognition", "on-device-speech-recognition")}} {{httpheader("Permissions-Policy")}} directive.

Specifically, where a defined policy blocks usage, any attempts to call the API's {{domxref("SpeechRecognition.available_static", "SpeechRecognition.available()")}} or {{domxref("SpeechRecognition.install_static", "SpeechRecognition.install()")}} methods will fail.

