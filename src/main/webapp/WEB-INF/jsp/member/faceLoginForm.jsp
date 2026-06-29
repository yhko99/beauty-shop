<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>얼굴 로그인</title>
    <script src="https://cdn.jsdelivr.net/npm/face-api.js@0.22.2/dist/face-api.min.js"></script>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; text-align: center; }
        h2 { color: #333; }
        #videoContainer { position: relative; display: inline-block; }
        video { border: 2px solid #ddd; border-radius: 8px; }
        canvas { position: absolute; top: 0; left: 0; }
        .btn { padding: 10px 25px; margin: 10px; background: #333; color: white; border: none; border-radius: 4px; cursor: pointer; font-size: 15px; }
        .btn:hover { background: #555; }
        #status { margin: 15px 0; font-size: 16px; color: #444; }
        #result { font-size: 18px; font-weight: bold; margin: 10px; }
        .link { margin-top: 15px; }
        .link a { color: #333; }
    </style>
</head>
<body>
    <h2>얼굴 로그인</h2>
    <p>카메라를 바라보고 로그인 버튼을 클릭하세요</p>

    <div id="videoContainer">
        <video id="video" width="480" height="360" autoplay muted></video>
        <canvas id="canvas"></canvas>
    </div>

    <br>
    <div id="status">모델 로딩 중...</div>
    <div id="result"></div>
    <br>
    <button class="btn" id="loginBtn" onclick="faceLogin()" disabled>얼굴로 로그인</button>

    <div class="link">
        <a href="/beauty-shop/member/loginForm">일반 로그인으로 이동</a>
    </div>

    <script>
        const video = document.getElementById('video');
        const status = document.getElementById('status');
        const result = document.getElementById('result');
        const loginBtn = document.getElementById('loginBtn');
        const MODEL_URL = '/beauty-shop/resources/models';

        let labeledDescriptors = [];

        async function loadModels() {
            await faceapi.nets.tinyFaceDetector.loadFromUri(MODEL_URL);
            await faceapi.nets.faceLandmark68Net.loadFromUri(MODEL_URL);
            await faceapi.nets.faceRecognitionNet.loadFromUri(MODEL_URL);
            status.innerText = '얼굴 데이터 불러오는 중...';
            await loadFaceData();
            startVideo();
        }

        async function loadFaceData() {
            const response = await fetch('/beauty-shop/member/getFaceData');
            const members = await response.json();

            if (members.length === 0) {
                status.innerText = '등록된 얼굴 데이터가 없습니다.';
                return;
            }

            labeledDescriptors = members
                .filter(m => m.faceDescriptor)
                .map(m => {
                    const descriptor = new Float32Array(JSON.parse(m.faceDescriptor));
                    return new faceapi.LabeledFaceDescriptors(m.memberId, [descriptor]);
                });

            status.innerText = '준비 완료! 카메라를 바라보세요.';
            loginBtn.disabled = false;
        }

        async function startVideo() {
            const stream = await navigator.mediaDevices.getUserMedia({ video: true });
            video.srcObject = stream;
        }

        async function faceLogin() {
            if (labeledDescriptors.length === 0) {
                status.innerText = '등록된 얼굴 데이터가 없습니다.';
                return;
            }

            status.innerText = '얼굴 인식 중...';
            const detection = await faceapi.detectSingleFace(video,
                new faceapi.TinyFaceDetectorOptions())
                .withFaceLandmarks()
                .withFaceDescriptor();

            if (!detection) {
                status.innerText = '얼굴을 찾을 수 없습니다. 다시 시도하세요.';
                return;
            }

            const matcher = new faceapi.FaceMatcher(labeledDescriptors, 0.5);
            const match = matcher.findBestMatch(detection.descriptor);

            if (match.label === 'unknown') {
                result.style.color = 'red';
                result.innerText = '❌ 일치하는 얼굴을 찾을 수 없습니다.';
                status.innerText = '다시 시도하거나 일반 로그인을 이용하세요.';
                return;
            }

            const response = await fetch('/beauty-shop/member/faceLogin', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ memberId: match.label })
            });

            const resultText = await response.text();
            if (resultText === 'success') {
                result.style.color = 'green';
                result.innerText = '✅ 로그인 성공!';
                setTimeout(() => { location.href = '/beauty-shop/product'; }, 1000);
            } else {
                result.style.color = 'red';
                result.innerText = '❌ 로그인 실패';
            }
        }

        loadModels();
    </script>
</body>
</html>