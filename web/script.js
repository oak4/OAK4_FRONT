const anchorNode = (link, name, current_link) => {
    const anchor = document.createElement('a');
    anchor.href = link;
    anchor.innerText = name;
    if (current_link === true) {
        anchor.classList.add('current_link');
    }
    return anchor;
};
const articleNode = (article) => {
    const anchor = document.createElement('a');
    // anchor.href = article.url;
    anchor.href = "article.html";

    const img = document.createElement('img');
    img.src = article.urlToImage;
    anchor.appendChild(img);

    const content = document.createElement('div');
    content.classList.add('content');
    anchor.appendChild(content);

    const date = document.createElement('p');
    date.innerText = new Date(article.publishedAt).toUTCString();
    content.appendChild(date);

    const title = document.createElement('h1');
    title.innerText = article.title;
    content.appendChild(title);

    const description = document.createElement('p');
    description.innerText = article.description;
    content.appendChild(description);

    return anchor;
}

const mainArticleNode = (article) => {
    const art = document.createElement('article');

    const img = document.createElement('img');
    img.src = article.urlToImage;
    art.appendChild(img);

    const cont = document.createElement('div');
    cont.classList.add('content');
    art.appendChild(cont);

    const date = document.createElement('p');
    date.innerText = new Date(article.publishedAt).toUTCString();
    cont.appendChild(date);

    const title = document.createElement('h1');
    title.innerText = article.title;
    cont.appendChild(title);

    const description = document.createElement('h2');
    description.innerText = article.description;
    cont.appendChild(description);

    Array.from(article.content.split('. ')).forEach(
        (p) => {
            const para = document.createElement('p');
            para.innerText = p;
            cont.appendChild(para);
        }
    )

    return art;
}

const populateCategories = (categories) => {
    const nav = document.getElementById('navbar');
    Array.from(categories).forEach(
        (category) => {
            const anchor = anchorNode(category.link, category.name, category.current_link);
            nav.appendChild(anchor);
        }
    )
};

const populateArticles = (articles) => {
    const cont = document.getElementById('articles-container');
    Array.from(articles).forEach(
        (article) => {
            cont.appendChild(articleNode(article));
        }
    )
};

const populateMainArticle = (article) => {
    const cont = document.getElementById('main');
    cont.appendChild(mainArticleNode(article));
}