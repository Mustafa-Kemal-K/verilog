# JK Flip-Flop Verilog Modeli

Bu proje, **JK Flip-Flop** devresinin Verilog dilinde modellenmesini ve test edilmesini içerir. Proje, `dFlipFlop` (D Flip-Flop) modülünü kullanarak JK Flip-Flop devresini oluşturur ve fonksiyonel test için bir testbench (`tb_jkff`) sunar.

## Dosya Yapısı

- **dFlipFlop**: D Flip-Flop devresini tanımlar.
- **jkff**: JK Flip-Flop devresini tanımlar.
- **tb_jkff**: JK Flip-Flop devresinin fonksiyonel doğruluğunu test eden testbench.

## Simülasyon

### Derleme ve Simülasyon Adımları:
1. Verilog dosyalarını derleyin.
2. `tb_jkff` testbench modülünü çalıştırarak simülasyonu başlatın.
3. Simülasyon sırasında, `J`, `K`, `clk`, `state` ve `reState` sinyallerinin değerlerini izleyin.

## Lisans

Bu proje, [MIT Lisansı](https://opensource.org/licenses/MIT) altında lisanslanmıştır.
