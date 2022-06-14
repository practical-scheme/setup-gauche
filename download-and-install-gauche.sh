version=$INPUT_GAUCHE_VERSION
if [ -z "$version" ]; then
    version=latest
fi

env

curl -f -o get-gauche.sh https://raw.githubusercontent.com/shirok/get-gauche/master/get-gauche.sh
chmod +x get-gauche.sh

case `uname` in
    Darwin)
        prefix=/usr/local;;
    *)
        prefix=/usr;;
esac

if [ "$INPUT_TEST_GAUCHE" = 'true' ]; then
    ./get-gauche.sh --sudo --auto --prefix=$prefix --version=$version
else
    ./get-gauche.sh --sudo --auto --prefix=$prefix --version=$version --skip-tests
fi
