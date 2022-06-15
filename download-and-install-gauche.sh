opts='--sudo --auto'

version=$1
if [ -z "$version" ]; then
    version=latest
fi
opts="$opts --version=$version"

case `uname` in
    Darwin)
        prefix=/usr/local;;
    *)
        prefix=/usr;;
esac
opts="$opts --prefix=$prefix"

do_test=$2
if [ "$do_test" = 'true' ]; then
    opts="$opts --skip-tests"
fi

configure_opts=$3
if [ ! -z "$configure_opts" ]; then
    opts="$opts --configure-args="'"'"$configure_opts"'"'
fi

curl -f -o get-gauche.sh https://raw.githubusercontent.com/shirok/get-gauche/master/get-gauche.sh
chmod +x get-gauche.sh

echo "Running get-gauche.sh $opts"
./get-gauche.sh $opts
