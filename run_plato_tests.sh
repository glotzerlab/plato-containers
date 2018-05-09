set -e

cd

mkdir -p "${PLATO_TEST_ARTIFACT_DIR}"

git clone https://bitbucket.org/glotzer/plato plato
cd plato
git checkout ${CIRCLE_SHA1}

# use global numpy/scipy
python3 -m pip install --no-deps --user rowan .
python3 -m pip install vispy pyglet --user
cd test
mkdir -p /tmp/test_results/plato
python3 -m nose --with-xunit --xunit-file=/tmp/test_results/plato/results.xml
