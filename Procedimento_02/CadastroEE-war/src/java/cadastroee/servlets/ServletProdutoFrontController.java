/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package cadastroee.servlets;

import cadastroee.controller.ProdutoFacadeLocal;
import cadastroee.model.Produto;
import jakarta.ejb.EJB;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;


@WebServlet(name = "ServletProdutoFrontController", urlPatterns = {"/ProdutoFC"})
public class ServletProdutoFrontController extends HttpServlet {
    
@EJB
private ProdutoFacadeLocal facade;

protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    request.setCharacterEncoding("UTF-8"); 

    String acao = request.getParameter("acao");
    if (acao == null) {
        acao = "listar";
    }

    String destino;

    if (acao.equals("listar")) {
        List<Produto> produtos = facade.findAll();
        request.setAttribute("produtos", produtos);
        destino = "ProdutoLista.jsp";
    } else if (acao.equals("formIncluir")) {
        destino = "ProdutoDados.jsp";

    } else if (acao.equals("formAlterar")) {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            Long id = Long.valueOf(idStr);
            Produto produto = facade.find(id);
            request.setAttribute("produto", produto);
        }
        destino = "ProdutoDados.jsp";

    } else if (acao.equals("excluir")) {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            Long id = Long.valueOf(idStr);
            Produto produto = facade.find(id);
            if (produto != null) {
                facade.remove(produto);
            }
        }
        List<Produto> produtos = facade.findAll();
        request.setAttribute("produtos", produtos);
        destino = "ProdutoLista.jsp";

    } else if (acao.equals("alterar")) {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            Long id = Long.valueOf(idStr);
            Produto produto = facade.find(id);
            if (produto != null) {
                produto.setNome(request.getParameter("nome"));
                produto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
                produto.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));
                facade.edit(produto);
            }
        }
        List<Produto> produtos = facade.findAll();
        request.setAttribute("produtos", produtos);
        destino = "ProdutoLista.jsp";

    } else if (acao.equals("incluir")) {
        Produto produto = new Produto();
        produto.setNome(request.getParameter("nome"));
        produto.setQuantidade(Integer.parseInt(request.getParameter("quantidade")));
        produto.setPrecoVenda(Float.parseFloat(request.getParameter("precoVenda")));
        facade.create(produto);
        List<Produto> produtos = facade.findAll();
        request.setAttribute("produtos", produtos);
        destino = "ProdutoLista.jsp";

    } else {
        List<Produto> produtos = facade.findAll();
        request.setAttribute("produtos", produtos);
        destino = "ProdutoLista.jsp";
    }


    RequestDispatcher dispatcher = request.getRequestDispatcher(destino);
    dispatcher.forward(request, response);
}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
