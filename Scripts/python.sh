#!/bin/bash

CONDA_BASE=$(conda info --base)
source "$CONDA_BASE/etc/profile.d/conda.sh"

conda create -n vizu python=3.12 -y
conda activate vizu
conda install pip -y
pip install numpy pandas scipy networkx plotly matplotlib dash python-dotenv rdkit umap-learn scikit-learn gpy gpyopt nbformat black ruff pynvim jupyter-client ueberzug pillow cairosvg pnglatex plotly pyperclip --no-input

conda create -n ml python=3.12 -y
conda activate ml
conda install pip -y
pip install numpy==1.26.4 pandas scipy networkx plotly matplotlib dash python-dotenv rdkit scikit-learn umap-learn gpy gpyopt torch==2.2 keras tensorflow nbformat shap black ruff pynvim jupyter-client ueberzug pillow cairosvg pnglatex plotly pyperclip --no-input
pip install dgl -f https://data.dgl.ai/wheels/torch-2.2/repo.html

conda create -n data python=3.12 -y
conda activate data
conda install pip -y
pip install numpy pandas scipy networkx plotly matplotlib dash python-dotenv rdkit nbformat mordredcommunity morfeus-ml black ruff pynvim jupyter-client ueberzug pillow cairosvg pnglatex plotly pyperclip --no-input

conda activate base
conda install conda-forge::xtb -y
conda install conda-forge::crest -y
conda install conda-forge::morfeus-ml -y
