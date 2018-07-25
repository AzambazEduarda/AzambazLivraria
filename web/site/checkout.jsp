
<%@page import="modelo.Livro"%>
<%@page import="modelo.Compralivro"%>
<%@page import="modelo.Compra"%>
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
    
    ///TOtal
%>
<%@include file="cabecalho.jsp" %>


<div class="col-md-12">
    <div class="form-group">
        <form method="post"action="#" class="colorlib-form">
            <h2>Dados da Compra</h2>
            <div class="row">

                <div class="form-group">
                    <div class="col-md-6">
                        <label for=fname>Nome do comprador:</label>
                        <%=cliente.getNome()%>
                    </div>
                    <div class="col-md-6">
                        <label for=lname>Endereço de entrega:</label>
                        <%=cliente.getEndereco()%>
                    </div>
                </div>
            </div>
    </div>
</form>
</div>
<div class="col-md-5">
    <form action="final.jsp">
        <div class="row form-group">                                  
            <div class="col-md-3">
                <input type="submit" value="Concluir Compra" class="btn btn-primary">
            </div>
        </div>
    </form>
</div>
</div>
</div>
</div>

<%@include file="rodape.jsp" %>
