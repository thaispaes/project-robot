from fpdf import FPDF
import os

# Função para gerar PDF a partir de screenshots do teste automatizado
def generate_pdf_from_screenshots(screenshot_dir, output_pdf):
    # Garantir que os caminhos sejam absolutos
    screenshot_dir = os.path.abspath(screenshot_dir)
    output_pdf = os.path.abspath(output_pdf)
    
    pdf = FPDF()
    # Configurar a página para A4
    pdf.set_auto_page_break(auto=True, margin=15)
    
    #Listar todos os arquivos png no diretorio de screenshots
    imagens = [f for f in os.listdir(screenshot_dir) if f.lower().endswith((".png"))]

    # Adicionar cada imagem como uma nova página no PDF
    for imagem in imagens:
        pdf.add_page()
        pdf.image(os.path.join(screenshot_dir, imagem), x=10, y=10, w=190)  # Ajuste a largura conforme necessário

    # Salvar o PDF gerado
    pdf.output(output_pdf)
    return output_pdf