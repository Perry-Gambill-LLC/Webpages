---
# Mexican Spanish translation of _apps/meowza.md. Every other setting (icon,
# App Store link, support email, ...) comes from the English page.
# source_hash records which version of the English page this translates;
# see "Translations" in README.md before changing it.
tagline: Platica con Mr. Whiskers, un gato amigable con IA que te hace compañía y recuerda sus conversaciones.
description: Soporte y política de privacidad de la app Meowza de Perry & Gambill LLC.
privacy_effective_date: 3 de agosto de 2026
source_hash: 1baa80c483fd
---
{%- assign source = site.apps | where: "slug", page.slug | where: "lang", site.lang | first -%}
{%- assign email = source.support_email | default: site.email -%}

## 1. Introducción {#introduction}

Te damos la bienvenida. Esta Política de privacidad explica cómo Perry & Gambill LLC ("nosotros" o "nuestro") recopila, usa, divulga y protege tu información cuando usas Meowza (la "App"), un compañero conversacional impulsado por IA. Lee esta política con atención. Si no estás de acuerdo con sus términos, deja de usar la App.

Nos reservamos el derecho de modificar esta Política de privacidad en cualquier momento. Te avisaremos de los cambios importantes actualizando la fecha de "Última actualización" que aparece arriba y, cuando corresponda, mediante notificaciones en la app o por correo electrónico.

## 2. Información que recopilamos {#information-we-collect}

### 2.1 Información que nos proporcionas directamente {#information-you-provide-directly}

- **Información de la cuenta:** nombre, correo electrónico y credenciales de inicio de sesión cuando te registras.
- **Datos del perfil:** datos opcionales del perfil que decidas proporcionar, incluida tu fecha de nacimiento (que se usa para personalizar la experiencia con tu compañero, por ejemplo, para reconocer tu cumpleaños).
- **Mensajes del chat:** los mensajes que envías al compañero de IA. Se almacenan cifrados en reposo con cifrado AES-256-GCM y se usan para generar las respuestas de la IA y mantener la continuidad de la conversación.
- **Comunicaciones:** comentarios o solicitudes de soporte que nos envíes.
- **Información de pago:** si aplica, nombre de facturación, dirección y datos del método de pago (procesados de forma segura por procesadores de pago externos; no almacenamos números de tarjeta completos).

### 2.2 Información que se recopila automáticamente {#information-collected-automatically}

- **Datos de uso:** funciones a las que accedes, acciones que realizas, duración de las sesiones y frecuencia de uso.
- **Información del dispositivo:** tipo de dispositivo, sistema operativo, tipo y versión del navegador, e identificadores únicos del dispositivo.
- **Datos de registro:** dirección IP, fecha y hora de acceso, registros de errores y URL de referencia.
- **Cookies y tecnologías de rastreo:** usamos cookies, balizas web y tecnologías similares para mantener las sesiones y analizar patrones de uso.

### 2.3 Información de terceros {#information-from-third-parties}

- **Proveedores de OAuth:** si inicias sesión con Apple, recibimos información básica del perfil (nombre y correo electrónico) según lo que permita tu configuración con ese proveedor.
- **Socios de análisis:** estadísticas de uso agregadas y anonimizadas de servicios de análisis.

## 3. Cómo usamos tu información {#how-we-use-your-information}

Usamos la información que recopilamos para:

- **Proporcionar y operar** la App y sus funciones.
- **Autenticar** tu identidad y mantener sesiones seguras.
- **Generar respuestas de la IA:** tus mensajes del chat y el contexto de tu perfil se envían a un modelo de IA de terceros (la API de OpenAI) para generar las respuestas del compañero. El contenido de los mensajes se transmite de forma segura y no se usa para entrenar modelos de IA.
- **Mantener la memoria de las conversaciones:** guardamos un resumen comprimido de las conversaciones anteriores para que el compañero recuerde el contexto entre sesiones. Este resumen está cifrado en reposo.
- **Personalizar** tu experiencia según tu perfil y tu historial de conversaciones.
- **Procesar transacciones** y enviar las confirmaciones y recibos correspondientes.
- **Enviar notificaciones push** para avisarte cuando tu compañero te haya respondido.
- **Comunicarnos** contigo sobre actualizaciones, nuevas funciones, alertas de seguridad y soporte.
- **Mejorar la App** mediante análisis, seguimiento de errores e investigación con usuarios.
- **Hacer cumplir nuestros Términos del servicio** y proteger la seguridad e integridad de la App.
- **Cumplir con obligaciones legales** y responder a solicitudes legítimas de las autoridades.

No vendemos tu información personal a terceros.

## 4. Bases legales del tratamiento (RGPD) {#legal-bases-for-processing-gdpr}

Si te encuentras en el Espacio Económico Europeo (EEE) o en el Reino Unido, nuestras bases legales para tratar tus datos personales son:

- **Necesidad contractual:** creación de la cuenta y prestación de las funciones principales de la app.
- **Intereses legítimos:** monitoreo de seguridad, prevención de fraudes y mejora del producto.
- **Obligación legal:** registros fiscales y respuesta a solicitudes legítimas.
- **Consentimiento:** correos de marketing y análisis opcionales.

Puedes retirar tu consentimiento en cualquier momento cuando nos basemos en él, sin que esto afecte la licitud del tratamiento realizado antes.

## 5. Cómo compartimos tu información {#sharing-your-information}

Podemos compartir tu información con:

- **Proveedores de servicios:** proveedores externos de confianza que nos ayudan a operar la App, incluidos Amazon Web Services (infraestructura en la nube y notificaciones push mediante Amazon SNS), OpenAI (inferencia de modelos de IA), Apple (autenticación y procesamiento de pagos) y proveedores de análisis. Estas partes están obligadas por contrato a proteger tus datos. Los mensajes del chat se transmiten a OpenAI únicamente para generar respuestas de la IA y, según nuestro acuerdo de servicio, OpenAI no los conserva para entrenar modelos.
- **Transferencias de negocio:** en caso de fusión, adquisición o venta de activos, tus datos podrían transferirse. Te avisaremos antes de que tus datos queden sujetos a una política de privacidad diferente.
- **Requisitos legales:** cuando lo exija la ley, una orden judicial o una autoridad gubernamental, o para proteger los derechos, la propiedad o la seguridad de nuestros usuarios o del público.
- **Con tu consentimiento:** en cualquier otra circunstancia en la que hayas autorizado expresamente la divulgación.

## 6. Conservación de datos {#data-retention}

Conservamos tu información personal mientras tu cuenta esté activa o mientras sea necesario para prestar los servicios. Puedes solicitar la eliminación de tu cuenta en cualquier momento (consulta la Sección 8). Después de la eliminación, podemos conservar ciertos datos de forma anonimizada o agregada, o cuando lo exija la ley, durante un periodo que no excederá **90 días** a partir de tu solicitud.

## 7. Seguridad de los datos {#data-security}

Aplicamos medidas técnicas y organizativas estándar de la industria para proteger tu información, entre ellas:

- Cifrado de los datos en tránsito (TLS/HTTPS) y en reposo (cifrado de sobre AES-256-GCM mediante AWS KMS para todos los mensajes del chat y resúmenes de conversación).
- Controles de acceso que limitan el acceso a los datos solo al personal autorizado.
- Auditorías de seguridad y evaluaciones de vulnerabilidades periódicas.

Ningún método de transmisión por internet ni de almacenamiento electrónico es 100% seguro. Aunque procuramos usar medios comercialmente aceptables para proteger tus datos, no podemos garantizar una seguridad absoluta.

## 8. Tus derechos y opciones {#your-rights-and-choices}

Según dónde te encuentres, puedes tener los siguientes derechos:

- **Acceso:** solicitar una copia de los datos personales que tenemos sobre ti.
- **Rectificación:** solicitar que se corrijan datos inexactos o incompletos.
- **Eliminación:** solicitar que se eliminen tus datos personales ("derecho al olvido").
- **Portabilidad:** recibir tus datos en un formato estructurado y legible por máquina.
- **Oposición:** oponerte al tratamiento basado en intereses legítimos.
- **Limitación:** solicitar que limitemos el tratamiento de tus datos en ciertas circunstancias.
- **Exclusión del marketing:** darte de baja de los correos promocionales con el enlace incluido en cualquiera de ellos o desde la configuración de tu cuenta.

Para ejercer cualquiera de estos derechos, contáctanos en la dirección indicada en la Sección 11. Responderemos en un plazo de **30 días**.

## 9. Privacidad de los niños {#childrens-privacy}

La App no está dirigida a menores de **13** años (o de **16** en el EEE). No recopilamos a sabiendas información personal de niños. Si descubrimos que recopilamos por error datos de un menor por debajo de la edad aplicable, tomaremos medidas para eliminarlos de inmediato. Si crees que un menor nos ha proporcionado información personal, contáctanos de inmediato.

## 10. Enlaces y servicios de terceros {#third-party-links-and-services}

La App puede contener enlaces a sitios web de terceros o integrarse con servicios de terceros. Esta Política de privacidad no se aplica a esos servicios externos. Te recomendamos revisar las políticas de privacidad de cualquier servicio de terceros al que accedas a través de la App.

## 11. Contáctanos {#contact-us}

Si tienes preguntas, inquietudes o solicitudes sobre esta Política de privacidad, contáctanos en [{{ email }}](mailto:{{ email }}).

Si te encuentras en el EEE y consideras que no hemos atendido adecuadamente tus inquietudes, tienes derecho a presentar una queja ante tu autoridad local de protección de datos.

## 12. Cambios a esta política {#changes-to-this-policy}

Podemos actualizar esta Política de privacidad periódicamente. Cuando lo hagamos, modificaremos la fecha de "Última actualización" al inicio de esta página. En caso de cambios importantes, te avisaremos de forma más visible (por ejemplo, con un aviso en la app o una notificación por correo electrónico). Si sigues usando la App después de que los cambios entren en vigor, aceptas la política revisada.

*Esta Política de privacidad se actualizó por última vez el 17 de mayo de 2026.*
