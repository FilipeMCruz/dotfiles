function search(event) {
    var x = event.key;
    if (x == "Enter") {
        event.preventDefault()
        let text = document.getElementById("searchbar").value;
        url = 'https://duckduckgo.com/?q=' + text
        window.open(url, '_self');
    }
}

function startTime() {
    const currentDate = new Date();
    document.getElementById("header-time").innerHTML = checkTime(currentDate.getHours()) + ":" + checkTime(currentDate.getMinutes());

    const dateOptions = {
        weekday: "long",
        year: "numeric",
        month: "long",
        day: "numeric"
    };

    document.getElementById("header-date").innerHTML = currentDate.toLocaleDateString("en-GB", dateOptions);

    setTimeout(startTime, (60 - currentDate.getSeconds()) * 1000);
}

function checkTime(time) {
    if (time < 10) {time = "0" + time};
    return time;
}
document.getElementById("container").addEventListener('DOMContentLoaded', startTime());
