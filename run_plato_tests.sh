cd

git clone https://bitbucket.org/glotzer/plato plato
cd plato

python3 -m pip install . vispy pyglet --user
cd test
python3 -m nose
