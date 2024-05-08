<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    oeoe c gregoriantojd

<script>
    // Example POST method implementation:
        async function postData(url = "", data = {}) {
        // Default options are marked with *
            const response = await fetch(url, {
            method: "GET", // *GET, POST, PUT, DELETE, etc.
            headers: {
            "X-MAL-CLIENT-ID": "5932deaeb0c92f9df074dfef529fa049", 
            // 'Content-Type': 'application/x-www-form-urlencoded',
            },

        });
        return response.json(); // parses JSON response into native JavaScript objects
        }

        postData("https://api.myanimelist.net/v2/anime?q=one&limit=4", { answer: 42 }).then((data) => {
        console.log(data); // JSON data parsed by `data.json()` call
    });
</script>



</body>
</html>