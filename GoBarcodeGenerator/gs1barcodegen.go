package gs1barcodegen

import (
	"bytes"
	"encoding/base64"
	"image/png"

	"github.com/boombuler/barcode"
	"github.com/boombuler/barcode/code128"
)

func GenerateGS1BarcodeIntoBase64EncodedPNG(stringToEmbed string, width int, height int) (string, error) {
	FNC1 := "\u00f1"
	barcodeImage, err := code128.Encode(FNC1 + stringToEmbed)

	if err != nil {
		return "", err
	}

	if width <= 0 || height <= 0 {
		return turnBarcodeToPNGBase64(barcodeImage)
	}

	resized, err := barcode.Scale(barcodeImage, width, height)
	if err != nil {
		return "", err
	}

	return turnBarcodeToPNGBase64(resized)
}

func turnBarcodeToPNGBase64(barcodeImage barcode.Barcode) (string, error) {
	var buf bytes.Buffer
	err := png.Encode(&buf, barcodeImage)

	if err != nil {
		return "", err
	}

	return base64.StdEncoding.EncodeToString(buf.Bytes()), nil
}
