<form action="${initParam['urlpaypal']}" method="POST" target="_top">
    <input type="hidden" name="business" value="ronald.381@live.com"/>
    <input type="hidden" name="return" value="${initParam['urlretorno']}"/>
    <input type="hidden" name="cmd" value="_cart"/>
    <input type="hidden" name="upload" value="1"/>

    <c:forEach  items="${sessionScope.carrito}" var="pro">
        <c:set var="c" value="${c+1}"/>
        <input type="hidden" name="item_name_${c}" value="${pro.p.nombre}" />
        <input type="hidden" name="item_number_${c}" value="${pro.p.idProducto}" />
        <input type="hidden" name="amount_${c}" value="${pro.p.precio}" />
        <input type="hidden" name="quantity_${c}" value="${pro.cantidad}" />

    </c:forEach>
    <input type="image" src="https://www.paypalobjects.com/es_XC/i/btn/btn_buynowCC_LG.gif" border="0" name="submit" alt="Paypal, la forma más rápida y segura de pagar en Internet. s">
    <img alt="" border="0" src="https://sandbox.paypal.com/es_ES/i/src/pixel.gif" width="1" height="1">



</form>