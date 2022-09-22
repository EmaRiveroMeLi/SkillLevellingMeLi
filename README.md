# SkillLevellingMeLi

La aplicacion de SkillLeveling busca simular el proceso de búsqueda de Mercado Libre para categorías y productos.
A la hora de realizar el proyecto, se optó por una arquitectura simple MVC. 

A traves de la searchbar, nos comunicamos con el primer endpoint, que realizaria la prediccion de categorias, de ese resultado, obtenemos el id de la categoria, que seria para obtener el segundo endpoint del Top Seller de 20 categorías. Luego, tenemos que obtener un listado de ids para pasarle como query al tercer llamado a la API, de la cual obtenemos el listado que mostraremos en la primera pantalla. 

Cuando seleccionamos cualquier producto, navegamos hacia la segunda pantalla que nos mostrará el detalle de ese producto (precio, titulo, imagen, etc.). Cabe destacar que nos comunicaremos con la API nuevamente para traer la descripcion general, pasandole como query el id del producto.

Tambien se añadio un tabbar y una tercer pantalla que agrega un listado de favoritos, a traves de UserDefaults.

Para el networking y comunicación con la API, se utilizó Alamofire, a través de cocoapods. 

