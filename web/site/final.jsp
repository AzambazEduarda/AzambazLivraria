
<%@page import="modelo.Livro"%>
<%@page import="dao.LivroDAO"%>
<%@page import="dao.CompralivroDAO"%>
<%@page import="dao.CompraDAO"%>
<%@page import="modelo.Compra"%>
<%@page import="modelo.Compralivro"%>
<%@page import="modelo.Cliente"%>
<%
    if (session.getAttribute("cliente") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    if (session.getAttribute("carrinho") == null) {
        response.sendRedirect("index.jsp");
        return;
    }

    Cliente cliente = (Cliente) session.getAttribute("cliente");
    List<Compralivro> carrinho = (List<Compralivro>)session.getAttribute("carrinho");
    Compra compra = new Compra();
    compra.setCliente(cliente);
    compra.setEndereco(cliente.getEndereco());
    Float valor = 0.0f;
    for(Compralivro car : carrinho){
        valor +=car.getValorunitario()*car.getQtdade();
    }
    compra.setValor(valor);
    CompraDAO compradao = new CompraDAO();
    Boolean certo = compradao.incluir(compra);
    if(certo)
    {
        CompralivroDAO clDAO = new CompralivroDAO();
        for(Compralivro car:carrinho){
            LivroDAO livroDAO = new LivroDAO();
            Livro livro = livroDAO.buscarPorChavePrimaria(car.getLivro().getId());
            
            car.setCompra(compra);
            clDAO.incluir(car);
        }
        session.setAttribute("carrinho", null);
    }
    else
    {
        
    }
    
%>
<%@include file="cabecalho.jsp" %>

