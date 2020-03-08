# C4702_C4459_demo
This is a demonstation of MSVC 2019 suspected bug.
There's false-positive C4702 and C4459 warnings.

Steps to reproduce:
- prepare OpenSSL build;
- prepare boost build;
- make a project using CMake;
- build a project in Release mode.
