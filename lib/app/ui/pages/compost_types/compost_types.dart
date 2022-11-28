import 'package:flutter/material.dart';
import 'package:autocompost/app/ui/routes/routes.dart';

class CompostTypes {
  final int? id;
  final double imageWidth, imageHeight;
  final String title, description, imageSrc,advantages, disadvantages;
  final Color? color;

  CompostTypes(
      { this.id,
        this.imageHeight=0,
        this.imageWidth=0,
        this.title = "0",
        this.description="0",
        this.imageSrc="0",
        this.color,
        this.advantages="0",
        this.disadvantages="0",
      });
}

List<CompostTypes> compostTypes = [
  CompostTypes(
    id: 1,
    title: "Giratorias",
    description: "Las composteras giratorias son aquellas que permiten mover todo el compost sin la necesidad de la utilización de palas o aireadores. Su sistema se basa en la disposición de la compostera en torno a un eje para permitir su rotación. Este tipo de compostera es considerado como uno de los métodos más eficiente y conveniente, debido a que mediante su rotación facilitan el proceso de mezclado del material logrando una buena oxigenación del proceso.",
    imageSrc: "assets/images/compost_types/compost_types_01.png",
    imageWidth: 350,
    imageHeight: 350,
    color: Color(0xFF65BD0D),
    advantages: "La principal ventaja de este proceso es que es un proceso rápido. Mientras que otros procesos de compostaje pueden tardar más de tres meses en producir compost, las composteras giratorias llevan a cabo este proceso en apenas 30 días.\n Es compatible con la mayoría de los residuos. A este tipo de composteras se les puede agregar casi que todo tipo de residuos que generamos en el hogar, hay que tener cuidado con materiales como los cítricos que pueden alterar el pH de la mezcla o con carnes crudas y lácteos que son propensos a generar malos olores temporales.\n Es libre de malos olores. Al ser un proceso oxigenado se lleva a cabo un compostaje aeróbico que además de ser eficiente no genera malos olores cuando es llevado a cabo adecuadamente. El giro facilita enormemente el proceso de oxigenar la mezcla y mezclar el material, que en otros tipos de compostaje se realiza manualmente.",
    disadvantages: "Su principal desventaja es la calidad del abono en comparación con otro tipo de composteras. La velocidad del proceso de compostaje compromete la calidad del abono. Los procesos de compostaje más exhaustivos que tardan varios meses como por ejemplo las pilas de compostaje o el lombricompost producirán un abono más nutritivo. Sin embargo sigue siendo un abono rico en nutrientes y de buena calidad.",
  ),

  CompostTypes(
    id: 2,
    title: "Lombricompost",
    description: "El lombricompost también conocido como vermicompost es una técnica de compostaje, donde el grueso del trabajo lo realizan lombrices que se alimentan de los residuos orgánicos y producen una forma de abono conocida como humus de lombriz. La especie de lombriz más popular para elaborar este tipo de abono es la lombriz roja californiana (Einsenia fetida).\n Para elaborar lombricompost se deben de seguir una serie de pasos, primero se debe preparar un sustrato orgánico que significa poner los residuos orgánicos a componerse por un periodo de al menos dos semanas, este proceso usualmente suele realizarse en pilas, posteriormente se añaden las lombrices al sustrato, estás lombrices se alimentaran de los residuos y producirán humus. El proceso puede durar entre 3 y 3,5 meses. Posteriormente se deben capturar las lombrices nuevamente, esto usualmente se hace añadiendo material fresco a la par del material que contiene las lombrices lo cual las incentiva a migrar a la nueva pila. El producto final es un abono de alta calidad y listo para ser aplicado a las plantas.",
    imageSrc: "assets/images/compost_types/compost_types_02.png",
    imageWidth: 350,
    imageHeight: 250,
    color: Color(0xFF3F4C0B),
    advantages: "La principal ventaja de este tipo de compostado es la alta calidad del abono. El producto final del lombricompost es un producto altamente descompuesto y estable, con alta disponibilidad de nutrientes para las plantas y una buena población de microorganismos benéficos. Además, el proceso de lombricompostaje no produce malos olores, sino que huele similar a un bosque después de la lluvia.",
    disadvantages: "Si bien el abono que se produce es de alta calidad, su principal desventaja es la lentitud del proceso. Desde que se genera el residuo orgánico hasta que el compost es apto para cosechar el proceso puede durar entre 4 y 5 meses, por lo que es un proceso lento en comparación a otras técnicas de compostaje. Además, no es compatible con todo tipo de residuos ya que las lombrices que trabajan en el proceso son delicadas y su población se puede ver severamente afectada cuando se añaden residuos altos en grasa, muchas proteínas como carnes o legumbres y exceso de materiales ácidos como cítricos.",
  ),

  CompostTypes(
    id: 3,
    title: "Pilas",
    description: "Las pilas de compostaje son el método mas sencillo y consiste en apilar nuestros residuos orgánicos en montañas formando capas con los siguientes materiales. Primero material rico en carbón como paja, madera, hojas secas o ramitas. Segundo un material rico en nitrógeno como residuos de verduras, cortes de zacate, y hojas verdes y tercero el suelo. El mantenimiento de la pila de compost consiste en voltear la pila con una pala o una horca y controlar la humedad, lo cual significa proteger la pila de la lluvia cuando en temporada lluviosa y humedecer la pila ligeramente en temporada seca. Si desea tener un proceso continuo es necesario tener al menos dos pilas, para poder dejar una de las pilas madurando por al menos 1 mes para tener compost listo. El proceso completo dura unos 4 meses; 3 de añadir material y 1 mes de maduración.",
    imageSrc: "assets/images/compost_types/compost_types_03.png",
    imageWidth: 350,
    imageHeight: 250,
    color: Color(0xFF3F4C0B),
    advantages: "La principal ventaja es la buena calidad del abono. Como las pilas produce compost en un proceso gradual es común que el producto final sea estable y contenga buena cantidad de nutrientes disponibles. Además, hacer compostaje mediante pilas es un proceso muy sencillo y es fácil identificar los eventuales problemas que se presente en proceso y solucionarlos.",
    disadvantages: "La principal desventajea es que es un proceso lento. El proceso completo dura unos 4 meses, por lo que es lento en comparación a otras técnicas de compostaje. También, es un proceso que requiere mucho espacio, para haccer compostaje continuo mediante pilas, se requiere de unos 2 metros cúbicos. Las pilas no son compatibles con todo tipo de residuos, al estar expuesto no es recomendable añadir residuos como lácteos o carnes crudas debido a que atraen a insectos y roedores no deseados.",
  ),

  CompostTypes(
    id: 4,
    title: "Bokashi",
    description: "El bokashi es un proceso de descomposición mediante fermentación anaeróbica, es decir a diferencia de las composteras o el takakura, el bokashi ocurre en un ambiente con escaso oxígeno. En realidad, el bokashi no corresponde a un método de compostaje, sino a un metódo de degradación de la materia orgánica, el producto final de este proceso es abono orgánico fermentado en lugar de compost. Para realizar bokashi se debe utilizar un recipiete que tenga una tapa que garantice un cierre completamente hermético. A estos recipientes se les añade una capa de inóculo seco para bokashi que contiene microorganismos eficientes. Este proceso se lo repite hasta llenar el recipiente. Posteriormente se deja reposar el material dentro del recipiente por 10 a 14 días y al final de este proceso se obtendrá un abono que contiene múltiples microorganismos benéficos, pero dado su alta acidez no se debe usar directamente sobre las plantas, sino que se debe enterrar o añadir a una pila de compost por 14 días adicionales para obtener el producto terminado, por lo que en algunos casos al bokashi se le conoce como un proceso de precompostaje.",
    imageSrc: "assets/images/compost_types/compost_types_04.png",
    imageWidth: 350,
    imageHeight: 350,
    color: Color(0xFF3F4C0B),
    advantages: "La principal ventaja es que al ser un recipiete hermético no genera malos olores, solamente se debe lidiar con ellos al incorporar nuevos residuos. Además, al ser un recipiente hermético va a ser un compost libre de moscas y bichos y es compatible con todo tipo de residuos.",
    disadvantages: "La principal desventaja de este tipo de compostaje es que el producto final corresponde a un pre-compost muy acídico que no puede usarse directamente para abonar las plantas, primero debe ser añadido a una pila de compost o enterrado, lo cual lo hace que este método sea incompatible para personas que no tienen un amplio jardín o un lugar donde enterrar el pre-compost. Otra desventaja es que el manejo de sistemas anaeróbicos es más complejo y técnico que el manejo de los sistemas aérobicos. Desbalances en el sistema son propenso a generar olores muy fuertes, y muchas veces la recomendación ante problemas es desechar los contenidos del recipiente y volver a comenzar dada lo difícil que resulta identificar y corregir los problemas como exceso de humedad, desbalance de nutrientes, falta de materiales ricos en energía o microorganismos insuficientes.",
  ),

  CompostTypes(
    id: 5,
    title: "Takakura",
    description: "El Takakura es un método de compostaje desarrollado en japón que consiste en inocular los residuos orgánicos con microorganismos fermentativos en un recipiente poroso que permita el intercambio de gases. En este método se añaden materiales diariamente a la caja de takakura, la cual se le debe contener una cama de bacterias que se elabora con una receta que requiere materiales como tierra, fermentos, granza, y harina. Durante 2 a 3 semanas se añaden los residuos a la caja, posteriormente se retira la mitad del contenido de la caja y se deja reposar durante 2 semanas adicionales para tener un abono maduro.",
    imageSrc: "assets/images/compost_types/compost_types_05.png",
    imageWidth: 350,
    imageHeight: 350,
    color: Color(0xFF3F4C0B),
    advantages: "Una de las principales ventajes es que las cajas de takakura ocupan menos de 1 metro cúbico, por lo que representan una excelente opción para aquellas personas que tienen limitaciones de espacio. También, es un proceso rapido, mientras que otros procesos de compostaje pueden tardar más de tres meses en producir compost, el takakura lleva a cabo este proceso en 30 a 40 días. La producción de takakura se basa en el mantenimiento de microorganismos eficientes, que son capaces de procesar los residuos orgánicos en poco tiempo, es justamente la presencia de estos organismos lo que permite un proceso de compostaje rápido.",
    disadvantages: "Una de las principales desventajes es que no es compatible con todo tipo de residuos. Al igual que las composteras giratorias el takakura no es compatible con varios tipos de residuos orgánicos como cítricos, lácteos o carnes crudas dado que tiene a producir olores fuertes. Adicionalmente la mayoría de las guías de takakura recomiendan no añadir aceites ni materiales duros como semillas grandes y ramitas ni papeles como servilletas o trozos de cartón. Otra desventaja es que para empezar el proceso se debe fabricar una cama de bacterias, lo que también se conoce como semilla takakura que involucra crear una mezcla con distintos materiales que incluyen un fermento hecho a base de azucar, yogurt o levadura, granza de arroz, levadura, agua sin cloro y tierra de un bosque. Además, el takakura produce un abono de mayor calidad que las composteras giratorias en cuento disponibilidad de nutrientes, sin embargo, como la mezcla usualmente no alcanza ni mantiene altas temperaturas por periodos prolongados de tiempo es más propensa a contener patógenos.",
  ),
];