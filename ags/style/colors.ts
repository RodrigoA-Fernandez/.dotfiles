import GLib from 'gi://GLib';

const Utils = {
  USER: GLib.get_user_name(),

  readFile: function(path: string): string | null {
    try {
      const [success, contents] = GLib.file_get_contents(path);
      if (!success) {
        throw new Error(`No se pudo leer el archivo en la ruta: ${path}`);
      }
      return contents;
    } catch (err) {
      logError(err, `Error leyendo el archivo: ${path}`);
      return null;
    }
  }
};

const path = `/home/${Utils.USER}/.local/share/ags/colors.json`;

export function getColors(): object | null {
  try {
    const colorsData = Utils.readFile(path);
    if (colorsData !== null) {
      const colors = JSON.parse(colorsData);
      log(`Colores leídos: ${JSON.stringify(colors)}`);
      return colors;
    } else {
      log("No se pudo leer el archivo de colores.");
      return null;
    }
  } catch (err) {
    logError(err, "Error parseando el JSON de colores.");
    return null;
  }
}

