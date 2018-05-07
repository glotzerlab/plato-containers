set -e

cd

mkdir -p "${PLATO_TEST_ARTIFACT_DIR}"

git clone https://bitbucket.org/glotzer/plato plato
cd plato

# use global numpy/scipy
python3 -m pip install --no-deps --user .
python3 -m pip install vispy pyglet --user
cd test
python3 -m nose
