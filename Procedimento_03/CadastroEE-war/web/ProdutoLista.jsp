

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Lista de Produtos</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #aaa;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #eee;
        }
        a {
            text-decoration: none;
            color: blue;
        }
        a:hover {
            text-decoration: underline;
        }
        .incluir-link {
            margin: 20px auto;
            display: block;
            width: 80%;
            text-align: right;
        }
    </style>
</head>
<body>

<h2 style="text-align: center;">Lista de Produtos</h2>

<div class="incluir-link">
    <a href="ServletProdutoFC?acao=formIncluir">Incluir Novo Produto</a>
</div>

<table>
    <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Quantidade</th>
            <th>Preço Venda</th>
            <th>Ações</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="produto" items="${produtos}">
        <tr>
            <td>${produto.id}</td>
            <td>${produto.nome}</td>
            <td>${produto.quantidade}</td>
            <td>${produto.precoVenda}</td>
            <td>
                <a href="ServletProdutoFC?acao=formAlterar&id=${produto.id}">Alterar</a> |
                <a href="ServletProdutoFC?acao=excluir&id=${produto.id}"
                   onclick="return confirm('Confirma exclusão do produto ${produto.nome}?');">Excluir</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
