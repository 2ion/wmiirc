#!/bin/bash
# Select a file using a GTK file selector via $(zenity), parse its mimetype and
# open it with an appropriate GUI application.

FILE="$(zenity --file-selection)"
if [ -n "$FILE" ]; then
    MIME="$(file --mime-type -b $FILE)"
    # Match the whole mime string
    case "$MIME" in
        "application/pdf")
            exec mupdf "$FILE"
            ;;
        "application/msword")
            case "${FILE##*.}" in
                'doc'|'docx')
                    exec lowriter "$FILE"
                    ;;
                'ppt'|'pptx')
                    exec loimpress "$FILE"
                    ;;
                'xls'|'xlsx')
                    exec localc "$FILE"
                    ;;
            esac
            ;;
        *)
            # Match mime prefix
            MIMEKEY=${MIME%%/*}
            case "$MIMEKEY" in
                "image")
                    exec feh "$FILE"
                    ;;
                "video")
                    exec /usr/bin/mplayer2 "$FILE"
                    ;;
                "audio")
                    exec /usr/bin/mplayer2 "$FILE"
                    ;;
                *)
                    ;;
            esac
    esac
fi
