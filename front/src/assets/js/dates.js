'use strict'

/**
 * 
 * @param {Date} date - Date à formater
 * @param {String} format - Format à retourner : 
 * "hh:mm:ss.ms dd/mm/yyyy" - 09:00:00.000 01/01/1970 - // TODO
 * "hh:mm:ss dd/mm/yyyy" - 09:00:00 01/01/1970
 * "Le dd/mm/yyyy à hh[h]mm" - Le 01/01/1970 à 09h00
 * "dd/mm/yyyy" - 01/01/1970
 * "yyyy-mm-dd" - 1970-01-01
 * "hh:mm:ss" - 09:00:00 - // TODO
 * "hh[h]mm dd/mm/yyyy" - 09h00 01/01/1970 - // TODO
 * "h[h]mm dd/mm/yyyy" - 9h00 01/01/1970 - // TODO
 * @returns {String}
 */
export function formatDate (date, format) {
  if (date) {
    date = new Date(date)
    switch (format) {
      case "dd/mm/yyyy":
        return `${date.getDate().toString().padStart(2, "0")}/${(date.getMonth() + 1).toString().padStart(2, "0")}/${date.getFullYear().toString().padStart(2, "0")}`
      case "yyyy-mm-dd":
        return `${date.getFullYear().toString().padStart(2, "0")}-${(date.getMonth() + 1).toString().padStart(2, "0")}-${date.getDate().toString().padStart(2, "0")}`
      case "hh:mm:ss dd/mm/yyyy":
        return `${date.getHours().toString().padStart(2, "0")}:${date.getMinutes().toString().padStart(2, "0")}:${date.getSeconds().toString().padStart(2, "0")} ${date.getDate().toString().padStart(2, "0")}/${(date.getMonth() + 1).toString().padStart(2, "0")}/${date.getFullYear().toString().padStart(2, "0")}`
      case "Le dd/mm/yyyy à hh[h]mm":
        return `Le ${date.getDate().toString().padStart(2, "0")}/${(date.getMonth() + 1).toString().padStart(2, "0")}/${date.getFullYear().toString().padStart(2, "0")} à ${date.getHours().toString().padStart(2, "0")}h${date.getMinutes().toString().padStart(2, "0")}`
      default:
        return date
    }
  } else return "Aucun RDV"
}
