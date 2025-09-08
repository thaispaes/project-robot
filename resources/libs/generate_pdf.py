from fpdf import FPDF
import os

#Pasta onde esta salvo os screenshots
screenshot_folder = './resources/results/screenshots/'
output_pdf = './resources/results/relatorio_teste.pdf'


#Listar imagens e ordenar por nome
images = sorted([f for f in os.listdir(screenshot_folder) if f.endswith(".png")])

pdf = FPDF()
pdf.set_auto_page_break(auto=True, margin=15)

for image in images:
    pdf.add_page()
    pdf.image(os.path.join(screenshot_folder, image), x=10, y=10, w=190)  # Ajuste a largura conforme necessário
    
pdf.output(output_pdf)
print(f"PDF gerado em: {output_pdf}")