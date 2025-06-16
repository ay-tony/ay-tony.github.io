// typst.math 适配
document.addEventListener("DOMContentLoaded", function () {
    const groups = document.querySelectorAll("svg g.typst-text");
    groups.forEach((group) => {
        const useElements = group.querySelectorAll("use");
        useElements.forEach((useEl) => {
            useEl.setAttribute("fill", "currentColor");
        });
    });
});

// typst.html.frame 适配
document.addEventListener("DOMContentLoaded", function() {
    const svgElements = document.querySelectorAll("svg.typst-doc");
    const styles = {
        width: "auto",
        height: "auto",
        maxWidth: "100%",
        maxHeight: "100%"
    };
    svgElements.forEach(svg => {
        Object.entries(styles).forEach(([property, value]) => {
            svg.style[property] = value;
        });
    });
});

// typst.datatime 显示适配，取消生成的 <p> 段间距
document.addEventListener("DOMContentLoaded", function () {
    const groups = document.querySelectorAll("div.post-meta");
    groups.forEach((group) => {
        const useElements = group.querySelectorAll("p");
        useElements.forEach((useEl) => {
            useEl.style["margin"] = 0;
        });
    });
});
