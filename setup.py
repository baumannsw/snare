#!/usr/bin/env python
from setuptools import find_packages, setup


setup(
    name="Snare",
    version="0.3.0",
    description="Super Next generation Advanced Reactive honEypot",
    author="Scott Baumann - forked from MushMush Foundation",
    author_email="baumannsw@gmail.com",
    url="https://github.com/baumannsw/snare",
    packages=find_packages(exclude=["*.pyc"]),
    scripts=["./bin/snare", "./bin/clone"],
)
