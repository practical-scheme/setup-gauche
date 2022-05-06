version=$INPUT_GAUCHE_VERSION
if [ -z "$version" ]; then
    version=latest
fi

curl -f -o get-gauche.sh https://raw.githubusercontent.com/shirok/get-gauche/master/get-gauche.sh
chmod +x get-gauche.sh

if [ "$INPUT_TEST_GAUCHE" = 'true' ]; then
    ./get-gauche.sh --sudo --auto --prefix=/usr --version=$version
else
    ./get-gauche.sh --sudo --auto --prefix=/usr --version=$version --skip-tests
fi
