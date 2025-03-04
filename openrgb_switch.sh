#!/bin/bash

# Directorio donde OpenRGB guarda los perfiles (ajusta según tu sistema)
PROFILE_DIR="$HOME/.config/OpenRGB"
# Archivo para almacenar el índice actual
INDEX_FILE="$HOME/.config/rgbprofiles/openrgb_index"

# Crear directorio de Polybar si no existe
mkdir -p "$(dirname "$INDEX_FILE")"

# Obtener lista de perfiles (.orp)
PROFILES=("$PROFILE_DIR"/*.orp)
NUM_PROFILES=${#PROFILES[@]}

# Si no hay perfiles, salir
if [ $NUM_PROFILES -eq 0 ]; then
  echo "No hay perfiles OpenRGB"
  exit 1
fi

# Leer índice actual o inicializarlo
if [ ! -f "$INDEX_FILE" ]; then
  echo 0 >"$INDEX_FILE"
fi
CURRENT_INDEX=$(cat "$INDEX_FILE")

# Manejar clics
if [ "$1" == "next" ]; then
  # Avanzar al siguiente perfil
  CURRENT_INDEX=$(((CURRENT_INDEX + 1) % NUM_PROFILES))
  echo $CURRENT_INDEX >"$INDEX_FILE"
elif [ "$1" == "prev" ]; then
  # Retroceder al perfil anterior
  CURRENT_INDEX=$(((CURRENT_INDEX - 1 + NUM_PROFILES) % NUM_PROFILES))
  echo $CURRENT_INDEX >"$INDEX_FILE"
fi

# Obtener el perfil actual
CURRENT_PROFILE=${PROFILES[$CURRENT_INDEX]}
PROFILE_NAME=$(basename "$CURRENT_PROFILE" .orp)

# Aplicar el perfil con OpenRGB
openrgb --profile "$CURRENT_PROFILE" >/dev/null 2>&1

# Mostrar el nombre del perfil en Polybar
echo "RGB: $PROFILE_NAME"
