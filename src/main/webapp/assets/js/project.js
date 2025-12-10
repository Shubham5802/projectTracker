function createProject() {
    const token = sessionStorage.getItem("jwt"); // stored after login

    const data = {
        projectName: document.getElementById("projectName").value,
        description: document.getElementById("description").value,
        startDate: document.getElementById("startDate").value,
        endDate: document.getElementById("endDate").value
    };

    fetch("/api/projects", {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer " + token
        },
        body: JSON.stringify(data)
    })
        .then(res => res.json())
        .then(data => {
            document.getElementById("responseMsg").innerText =
                "Project created successfully! Project ID: " + data.projectId;
        })
        .catch(err => console.log(err));
}
