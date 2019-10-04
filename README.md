### Mac OS app with bug in Apple GameKit "**GKRidgedNoiseSource**"

This is a simple Mac OS app with GameKit's **GKRidgedNoiseSource** bug demonstrating on Mac OS platform, but bug can be reproduced on iOS and other platforms.

### DESCRIPTION:

In "2ϝ" section with Sprite texture computed with Perlin Noise Map created from **GKRidgedNoiseSource** is compressed on **X** axis (using double frequency *as example*) with  ***PerlinNoiseSource***, but must just accurate downscaled (at both **X** and **Y** axes), with simple/default **GKPerlinNoiseSource** texture properly downscaled.
