document.addEventListener("DOMContentLoaded", function () {
    const groups = document.querySelectorAll("svg g.typst-text");

    groups.forEach((group) => {
        const useElements = group.querySelectorAll("use");
        useElements.forEach((useEl) => {
            useEl.setAttribute("fill", "currentColor");
        });
    });
});
