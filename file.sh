python3 << 'EOF'
p = "api/src/processing/services/youtube.js"
s = open(p).read()

old1 = 'const ytdlpContainer = { h264: "mp4", vp9: "webm", av1: "webm" };'
new1 = old1 + '''

// HLS/m3u8 playlist URLs are not directly fetchable by the tunnel;
// only pick formats with direct media URLs.
const isDirectMedia = (f) => {
    const proto = String(f.protocol || "").toLowerCase();
    const url = String(f.url || "").toLowerCase();
    return !proto.includes("m3u8") && !url.includes(".m3u8");
};'''
assert s.count(old1) == 1
s = s.replace(old1, new1)

old2 = '.filter(f => f.acodec && f.acodec !== "none" && (!f.vcodec || f.vcodec === "none"))'
new2 = '.filter(f => f.acodec && f.acodec !== "none" && (!f.vcodec || f.vcodec === "none") && isDirectMedia(f))'
assert s.count(old2) == 1
s = s.replace(old2, new2)

old3 = '''            f.vcodec.startsWith(prefix) &&
            f.height && f.height <= quality'''
new3 = '''            f.vcodec.startsWith(prefix) &&
            f.height && f.height <= quality &&
            isDirectMedia(f)'''
assert s.count(old3) == 1
s = s.replace(old3, new3)

open(p, "w").write(s)
print("patched OK")
EOF
grep -c "isDirectMedia" api/src/processing/services/youtube.js
