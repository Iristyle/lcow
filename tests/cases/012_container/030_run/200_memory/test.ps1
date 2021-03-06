# SUMMARY: Verify that docker container run --memory works
# LABELS:
# REPEAT:

$libBase = Join-Path -Path $env:RT_PROJECT_ROOT -ChildPath _lib
$lib = Join-Path -Path $libBase -ChildPath lib.ps1
. $lib

$output = [string] (& docker container run --platform linux --rm --memory 104857600 alpine:3.7 cat /sys/fs/cgroup/memory/memory.limit_in_bytes 2>&1)
if ($lastexitcode -ne 0) {
    $output
    exit 1
}
$output

if (!($output -match "104857600")) {
    exit 1
}
exit 0
