﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JWT_Example.Models
{
    public class UsuarioInfo
    {
        public Guid Id { get; set; }
        public string Nombre { get; set; }
        public string Apellidos { get; set; }
        public string Email { get; set; }
        public string Rol { get; set; }
    }
}