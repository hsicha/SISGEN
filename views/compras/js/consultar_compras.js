
 

function detalle_compras(url, valor)
{
  console.log("codigo compras"+" "+valor)
  $.ajax({
    method: "POST",
    url: url,
    data: {idcompras:valor},
    dataType:'json',
    success:function(data)
    {
      console.log(data[0][0])
      $(".proveedor").text("Proveedor"+":"+" "+data[0][0]);
        $(".ruc").text(data[0][3] + ":" + " " + data[0][1]);
          $(".tpc").text("T. Contribuyente" + ":" + " " + data[0][2]);
            $(".direccion").text("Dirección" + ":" + " " + data[0][4]);
              $(".telefono").text("Teléfono" + ":" + " " + data[0][5]);
                $(".serie").text("N° Serie" + ":" + " " + data[0][6]);
                  $(".ncom").text("N° Comprobante" + ":" + " " + data[0][7]);
                    $(".tpago").text("T. Pago" + ":" + " " + data[0][8]);
                      $(".fecha").text("Fecha Compra" + ":" + " " + data[0][9]
                      );

       $("#tdata").empty();
       importe = 0;
        total = 0;
        base=0;
        igv=0;
        valIGV=1.18;
      for(var i=0; i<data.length;i++){
        
        importe = data[i][11] * data[i][13];
        total+=importe;
        var fila = '<tr class="filas" id="fila">';
        fila += "<td class=' text-dark fw-bold'>" + data[i][11] + "</td>";
        fila += "<td class='text-dark fw-bold'>" + data[i][12] + "</td>";
        fila += "<td class='text-dark fw-bold'>" + data[i][13] + "</td>";
        fila += "<td class='text-dark fw-bold'>" + importe + "</td>";
        fila += '</tr>';
        $("#tdata").append(fila);
      }

       base = (total / valIGV).toFixed(2);
       igv = (total - base).toFixed(2);
       
    var  fila2="<tr>"
       fila2 += "<td colspan='2'></td>";
       fila2 +=
         "<td class='border border-primary text-dark fw-bold'>SUB TOTAL " +
         "<br/>" +
         "IGV" +
         "<br/>" +
         "TOTAL" +
         " <td class='text-dark fw-bold'>" +
         "S/. " +" "+
         parseFloat(base).toFixed(2) +
         "<br />" +
         "S/. " +" "+
         parseFloat(igv).toFixed(2) +
         "<br/>" + 
         "S/. " + " "+
         parseFloat(total).toFixed(2) +
         " </td> </td>";
       fila2+="</tr>" 

       $("#tdata").append(fila2);
      
     console.log("valor total S/. " +" "+total)
      
    },
    error:function(data){
      console.log(data);

    }
  });
  $("#modalDetalle").modal('show');
}



function detalle_compras(url, valor)
{
  console.log("codigo compras"+" "+valor)
  $.ajax({
    method: "POST",
    url: url,
    data: {idcompras:valor},
    dataType:'json',
    success:function(data)
    {
      console.log(data[0][0])
      $(".proveedor").text("Proveedor"+":"+" "+data[0][0]);
        $(".ruc").text(data[0][3] + ":" + " " + data[0][1]);
          $(".tpc").text("T. Contribuyente" + ":" + " " + data[0][2]);
            $(".direccion").text("Dirección" + ":" + " " + data[0][4]);
              $(".telefono").text("Teléfono" + ":" + " " + data[0][5]);
                $(".serie").text("N° Serie" + ":" + " " + data[0][6]);
                  $(".ncom").text("N° Comprobante" + ":" + " " + data[0][7]);
                    $(".tpago").text("T. Pago" + ":" + " " + data[0][8]);
                      $(".fecha").text("Fecha Compra" + ":" + " " + data[0][9]
                      );

       $("#tdata").empty();
       importe = 0;
        total = 0;
        base=0;
        igv=0;
        valIGV=1.18;
      for(var i=0; i<data.length;i++){
        
        importe = data[i][11] * data[i][13];
        total+=importe;
        var fila = '<tr class="filas" id="fila">';
        fila += "<td class=' text-dark fw-bold'>" + data[i][11] + "</td>";
        fila += "<td class='text-dark fw-bold'>" + data[i][12] + "</td>";
        fila += "<td class='text-dark fw-bold'>" + data[i][13] + "</td>";
        fila += "<td class='text-dark fw-bold'>" + importe + "</td>";
        fila += '</tr>';
        $("#tdata").append(fila);
      }

       base = (total / valIGV).toFixed(2);
       igv = (total - base).toFixed(2);
       
    var  fila2="<tr>"
       fila2 += "<td colspan='2'></td>";
       fila2 +=
         "<td class='border border-primary text-dark fw-bold'>SUB TOTAL " +
         "<br/>" +
         "IGV" +
         "<br/>" +
         "TOTAL" +
         " <td class='text-dark fw-bold'>" +
         "S/. " +" "+
         parseFloat(base).toFixed(2) +
         "<br />" +
         "S/. " +" "+
         parseFloat(igv).toFixed(2) +
         "<br/>" + 
         "S/. " + " "+
         parseFloat(total).toFixed(2) +
         " </td> </td>";
       fila2+="</tr>" 

       $("#tdata").append(fila2);
      
     console.log("valor total S/. " +" "+total)
      
    },
    error:function(data){
      console.log(data);

    }
  });
  $("#modalDetalle").modal('show');
}




  
