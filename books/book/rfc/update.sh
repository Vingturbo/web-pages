rsync -avz --delete rsync.rfc-editor.org::rfcs-text-only rfc
rm ./index.html

cat > ./index.html <<EOF
<!DOCTYPE html>

<html lang="zh-CN">

<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="../../../favicon.png">
        <link rel="stylesheet" href="../../../info.css">
        <title>RFC文档</title>
</head>

<body>
    <h1>RFC文档</h1>
    <p>每个文档的作用可以查看<a href="./rfc/rfc-index.txt">RFC文档引索</a></p>
    <p>以下只会列出正式发布的RFC文档</p>
    <p>
        <ul>
EOF

awk '{print "           <li><a href=\"./rfc/" $0 "\">" $0 "</a></li>"}' <(ls -1v ./rfc/ | grep -E "rfc[0-9]+\.txt") >> ./index.html

cat >> ./index.html <<EOF
        </ul>
    </p>
</body>

</html>
EOF