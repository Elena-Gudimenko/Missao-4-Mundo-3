<%@page import="cadastroee.model.Produto"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Cadastro de Produto</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4Q6Gf2aSP4eDXB8Miphtr37CMZZQ5oXLH2yaXMJ2w8e2ZtHTl7GptT4jmndRuHDT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js" integrity="sha384-j1CDi7MgGQ12Z7Qab0qlWQ/Qqz24Gc6BM0thvEMVjHnfYGF0rmFCozFSxQBxwHKO" crossorigin="anonymous"></script>
</head>
<body class="container">

<%
    // Определим переменные Java
    Produto produto = (Produto) request.getAttribute("produto");
    String acao = (produto == null) ? "incluir" : "alterar";
%>

<h2 style="text-align: center;">
    <%= (acao.equals("incluir") ? "Incluir Novo Produto" : "Alterar Produto") %>
</h2>

<form action="ServletProdutoFC" method="post" class="mx-auto mt-4 p-4 border rounded bg-light" style="max-width: 400px;">
    <input type="hidden" name="acao" value="<%= acao %>"/>

    <c:if test="${produto != null}">
        <input type="hidden" name="id" value="${produto.id}"/>
    </c:if>

    <div class="mb-3">
        <label for="nome" class="form-label">Nome:</label>
        <input type="text" id="nome" name="nome" value="${produto.nome}" required class="form-control"/>
    </div>

    <div class="mb-3">
        <label for="quantidade" class="form-label">Quantidade:</label>
        <input type="number" id="quantidade" name="quantidade" value="${produto.quantidade}" required class="form-control"/>
    </div>

    <div class="mb-3">
        <label for="precoVenda" class="form-label">Preço de Venda:</label>
        <input type="number" id="precoVenda" name="precoVenda" step="0.01" value="${produto.precoVenda}" required class="form-control"/>
    </div>

    <button type="submit" class="btn btn-primary">
        <%= (acao.equals("incluir") ? "Incluir Produto" : "Salvar Alterações") %>
    </button>
</form>


</body>
</html>
