<%@page import="cadastroee.model.Produto"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Cadastro de Produto</title>
    <style>
        form {
            width: 400px;
            margin: 30px auto;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 8px;
            background-color: #f9f9f9;
        }
        label, input {
            display: block;
            width: 100%;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            width: auto;
            padding: 8px 16px;
        }
    </style>
</head>
<body>

<%
    // Определим переменные Java
    Produto produto = (Produto) request.getAttribute("produto");
    String acao = (produto == null) ? "incluir" : "alterar";
%>

<h2 style="text-align: center;">
    <%= (acao.equals("incluir") ? "Incluir Novo Produto" : "Alterar Produto") %>
</h2>

<form action="ServletProdutoFC" method="post">
    <input type="hidden" name="acao" value="<%= acao %>"/>

    <c:if test="${produto != null}">
        <input type="hidden" name="id" value="${produto.id}"/>
    </c:if>

    <label for="nome">Nome:</label>
    <input type="text" id="nome" name="nome" value="${produto.nome}" required/>

    <label for="quantidade">Quantidade:</label>
    <input type="number" id="quantidade" name="quantidade" value="${produto.quantidade}" required/>

    <label for="precoVenda">Preço de Venda:</label>
    <input type="number" id="precoVenda" name="precoVenda" step="0.01" value="${produto.precoVenda}" required/>

    <input type="submit" value="<%= (acao.equals("incluir") ? "Incluir Produto" : "Salvar Alterações") %>"/>
</form>

</body>
</html>
