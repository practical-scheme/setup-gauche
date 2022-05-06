version=$INPUT_GAUCHE_VERSION
need_test=$INPUT_TEST_GAUCHE

curl -f -o get-gauche.sh https://raw.githubusercontent.com/shirok/get-gauche/master
chmod +x get-gauche.sh

if [ "$need_test" = 'true' ]; then
    test_opt=
else
    test_opt=--skip-test
fi

./get-gauche.sh --sudo --auto --prefix=/usr --version=$version $test_opt
