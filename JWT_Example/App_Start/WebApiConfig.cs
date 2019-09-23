using JWT_Example.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http.Headers;
using System.Web.Http;

namespace JWT_Example
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Configuración y servicios de API web

            // Rutas de API web
            config.MapHttpAttributeRoutes();
            // ELIMINAMOS EL FORMATEADOR DE RESPUESTAS XML
            config.Formatters.XmlFormatter.SupportedMediaTypes.Clear();
            // HABILITAMOS EL FORMATEADOR DE RESPUESTAS JSON
            config.Formatters.JsonFormatter.SupportedMediaTypes.Add(new MediaTypeHeaderValue("application/json"));

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );
            config.Formatters.JsonFormatter.SerializerSettings.ReferenceLoopHandling
            = Newtonsoft.Json.ReferenceLoopHandling.Ignore;
            config.MessageHandlers.Add(new ValidarTokenHandler());
        }
    }
}
