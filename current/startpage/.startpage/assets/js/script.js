function startTime() {
    const currentDate = new Date();
    document.getElementById("header-time").innerHTML = currentDate.toLocaleTimeString().substring(0, 5);

    const dateOptions = {
        weekday: "long",
        year: "numeric",
        month: "long",
        day: "numeric"
    };

    document.getElementById("header-date").innerHTML = currentDate.toLocaleDateString("en-GB", dateOptions);
}

document.getElementById("container").addEventListener('DOMContentLoaded', startTime());
