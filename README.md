
# Modulo para polybar

![openrgb](https://github.com/firstatack/polybar_openrgb/blob/main/openrgb.png?raw=true)

### Requisitos:

Tener instalado **Openrgb** y haber creado varios perfiles desde el propio programa.
Una vez todo este configurado con tansolo darle click derecho o izquierdo intercambiamos los perfiles de color del teclado

### Instalacion y configuracion:
 
1º- Copiar el script openrgb_swicht.sh a la ruta donde tengais los scripts de polybar par mantener orden y dadle permisos.

```bash
chmod +x openrgb_swicht.sh
```

2º- Agregar el contenido del fichero config a vuestro config de polybar **modificando las rutas al script** o si teneis los modulos en un fichero aparte a vuestro fichero modules.

3º- Cargarlo en la seccion que sea vuestra preferencia con **openrgb**

```bash
modules-center = space LD discord RD space LD VirtualBox RD space space LD nvim RD space LD MS_VisualStudioCode RD space LD openrgb RD space LD voam RlD space LD battery RD
```
