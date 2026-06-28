# Fringe Cases

## Warnings & Notes

> [!NOTE]
> When the `codecs` parameter is used, the specified list of codecs must include every codec used for the contents of the file. The list may also contain codecs not present in the file.

> [!NOTE]
> Chromium-based browsers will accept any subset of the optional parameters (rather than all or none, as required by the specification).

> [!NOTE]
> The specification originally mandated that the Audio Object Type number in the third component be only one decimal digit. However, amendments to the specification over time extended the range of these values well beyond one decimal digit, so now the third parameter may be either one or two digits. Padding values below 10 with a leading `0` is optional. Older implementations of MPEG-4 codecs may not support two-digit values, however, so using a single digit when possible will maximize compatibility.

          > [!NOTE]
          > In the above examples, the value `1` means `general_profile_space === 0` (no character) and `general_profile_idc === 1`.

        > [!NOTE]
        > In the above examples, the value `6` means `general_profile_compatibility_flag === 6`.

        > [!NOTE]
        > In the above examples, the value `L186` means `general_tier_flag === 0` followed by `general_level_idc === 186`.

        > [!NOTE]
        > In the above examples, there is only one constraint flag present — `B0`.

