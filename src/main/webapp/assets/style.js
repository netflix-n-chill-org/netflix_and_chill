function addMovie() {
    var modal = document.getElementById("add_Movie");
    modal.style.display = "block";
}

function openModalSeaech() {
    var modal = document.getElementById("modalSearch");
    modal.style.display = "block";
}

function openModalShows() {
    var modal = document.getElementById("modalShows");
    modal.style.display = "block";
}

function openModalAdd() {
    var modal = document.getElementById("modalAdd");
    modal.style.display = "block";
}


function openModalUpdate() {
    var modal = document.getElementById("modalUpdate");
    modal.style.display = "block";
}


window.onclick = function (event) {
    var modalAdd = document.getElementById("modalAdd");
    if (event.target === modalAdd) {
        modalAdd.style.display = "none";
    }

    var modalSearch = document.getElementById("modalSearch");
    if (event.target === modalSearch) {
        modalSearch.style.display = "none";
    }

    var modalShows = document.getElementById("modalShows");
    if (event.target === modalShows) {
        modalShows.style.display = "none";
    }
}

window.onclick = function (event) {
    var modal = document.getElementById("openModalAdd");
    if (event.target === modal) {
        modal.style.display = "none";
    }
}

function closeUpdateMovie() {
    var updateMovie = document.getElementById("update_movie");
    updateMovie.style.display = "none";
}

function closeAddMovie() {
    var addMovie = document.getElementById("add_Movie");
    addMovie.style.display = "none";
}

function toggleOverlay() {
    var overlay = document.getElementById('overlay');
    overlay.style.display = (overlay.style.display === 'none' || overlay.style.display === '') ? 'block' : 'none';
}

function toggleOverlay() {
    var showMovie = document.getElementById('showMovie');
    showMovie.classList.toggle('active');
}

function redirectToShowMovie() {
    window.location.href = "../movie/showMovie.jsp";
}

function redirectToDelete() {
    window.location.href = "../movie/deleteMovie.jsp";
}


