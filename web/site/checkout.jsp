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
    <div class="cart-detail">
        <h2>Carrinho</h2>
        <ul>
            <li>
                <ul>
                    <li><span>1 x Product Name</span> <span>$78.00</span></li>
                </ul>
            </li>
            <li><span>Total</span> <span>$180.00</span></li>
        </ul>
    </div>
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
