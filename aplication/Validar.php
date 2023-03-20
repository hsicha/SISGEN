<?php

class Validar
{

  

    public static function moneda()
    {
        return "S/.";
    }

    public static function dni($valor)
    {
        $dni = trim($valor);

        if (!empty($dni)) {
            if (is_numeric($dni)) {
                if (strlen($dni) == 8) {
                    $msgbox['valor'] = "Ok";
                } else {
                    $msgbox["valor"] = 'El DNI no es válido, porque tiene ' . strlen($dni) . ' dígitos';
                }
            } else {
                $msgbox["valor"] = 'El DNI tiene un formato incorrecto, verifique';
            }
        } else {
            $msgbox["valor"] = 'Por Favor Ingrese el N° de DNI';
        }
        return $msgbox;
    }

    public static function post($valor)
    {
        $variable = trim($valor);
        if (empty($variable)) {
            return false;
        } else {
            return true;
        }
    }

    public static function int($valor)
    {
        $entero = trim($valor);

        if (filter_var($entero, FILTER_VALIDATE_INT) === false) {
            return false;
        } else {
            return true;
        }
    }

    public static function email($valor)
    {
        $email = trim($valor);
        if (filter_var($valor, FILTER_VALIDATE_EMAIL) === false) {
            return false;
        } else {
            return true;
        }
    }

    public static function clave($valor1, $valor2)
    {
        $clave1 = trim($valor1);
        $clave2 = trim($valor2);

        if (strlen($clave1) < 6) {
            $msgbox['valor'] = "La Contraseña debe tener al menos 6 caracteres";
        } else if ($clave1 != $clave2) {
            $msgbox['valor'] = "Las Contraseñas no coinciden, por favor verifique";
        } else {
            $msgbox['valor'] = "Ok";
        }
        return $msgbox;
    }

    public static function fecha($valor)
    {
        $fecha = explode("-", trim($valor));
        if (!checkdate($fecha[1], $fecha[2], $fecha[0])) {
            return false;
        } else {
            return true;
        }
    }

    public static function igv()
    {
        return "18";
    }

    public static function calcular_igv($total)
    {
        $valorIgv = "18";
        $baseIgv  = (1 + ($valorIgv / 100));
        $subtotal = ($total / $baseIgv);
        $totalIgv = ($subtotal * ($valorIgv / 100));
        return str_replace(",", "", number_format($totalIgv, 2));
    }

    public static function calcular_subtotal($total)
    {
        $valorIgv = "18";
        $baseIgv  = (1 + ($valorIgv / 100));
        $subtotal = ($total / $baseIgv);
        return str_replace(",", "", number_format($subtotal, 2));
    }

    public static function calcular_ticket($total)
    {
        $valorIgv = "18";
        $total    = str_replace(",", "", $total);
        $baseIgv  = (1 + ($valorIgv / 100));
        $subTotal = ($total / $baseIgv);
        $Igv      = ($subTotal * ($valorIgv / 100));
        $data     = array(
            'subtotal' => str_replace(",", "", number_format($subTotal, 2)),
            'igv'      => str_replace(",", "", number_format($Igv, 2)),
            'total'    => str_replace(",", "", number_format($total, 2))
            );

        return $data;
    }
}



?>