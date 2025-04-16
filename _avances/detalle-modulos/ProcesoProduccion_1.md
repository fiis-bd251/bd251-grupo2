## Responsable
Lisseth del Carmen Arnao Morocho

---

## ¿Cuál es el objetivo de su módulo?

El módulo de **Proceso Productivo** es el encargado del ingreso de datos de cada evento del proceso que sucede por **Lote de Producto** relacionado a la **Orden**. Los eventos son:

- **Dosificado**
- **Mezclado**
- **Moldeado**
- **Secado**
- **Envasado**

Asimismo, se podrá actualizarla según corresponda.

---

## ¿A quién beneficia el funcionamiento de su módulo? (Área interna, cliente - persona o empresa)

El módulo beneficia al **área interna**, como actor al **área de producción** y como cliente al **área de almacén de producto**. 

El motivo es que permitirá la **trazabilidad de la Orden de Producción**, al registrar todos los datos relacionados desde la creación de la misma hasta su cierre. Al momento de cerrarlo, los productos pasarán a almacernarse para posteriormente ser distribuídos.

---

## ¿Qué resultado genera su módulo? ¿Es un producto o un servicio? ¿Qué características tiene?

Es un **servicio** dirigido, sobre todo, a los operarios que trabajan durante el desarrollo del **Proceso Productivo**. 

Se ingresarán datos por evento del proceso considerando el usuario del empleado, sean:

### **Dosificado**
- Se ingresa el valor de la **cantidad dosificada por insumo**.

### **Mezclado**
- Se detalla la **máquina utilizada** en el evento.
- Se ingresa el **tiempo de duración** del evento.
- Se ingresan **parámetros**:
  - Porcentaje de **humedad**
  - **Cantidad de agua**

### **Moldeado**
- Se especifica el **tipo de molde o boquilla**.
- Se detalla la **máquina utilizada** en el evento.
- Se especifica el **tipo y tamaño de corte**.

### **Secado**
- Se detalla la **máquina utilizada** en el evento.
- Se ingresa el **tiempo de duración** del evento.
- Se ingresan **parámetros**:
  - Porcentaje de **hidratación**
  - **Número de bandejas** usadas

### **Envasado**
- Se especifica el **tipo de envasado**.
- Se ingresa el **peso final del producto**.

---

## ¿Qué recursos se emplean para obtener dicho resultado?

### **Recursos humanos:**
- **Operarios de Producción**

### **Recursos tecnológicos:**
- **Maquinaria**

### **Recursos de información:**
- **Valores por evento del proceso**

---

## ¿Cómo se planifican el uso de estos recursos?

Los recursos se asignan durante el proceso de **creación de la Orden de Producción**. 

Es decir, está conectado al proceso de **planeamiento** que realiza el **módulo de Control de Producción**. Ellos crean la orden y de ahí se procede a crear un proceso productivo asociado a cada lote de la orden de producción.

---

## ¿Cómo se reserva el uso / la propiedad del producto o servicio generado?

El ticket es la **Órden de Producción**, ya que el proceso iniciará únicamente cuando se haya creado la orden. Este designa y garantiza los recursos necesarios.
