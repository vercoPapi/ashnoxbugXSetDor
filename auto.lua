-- Konfigurasi
local jumlah_loop = 500
local nama_target = "Wild" -- Nama/Karakteristik yang dicari

function proses_otomatis()
    for i = 1, jumlah_loop do
        -- 1. Pindai memori atau objek untuk menemukan "Wild"
        -- Contoh: gg.searchNumber(nama_target, gg.TYPE_AUTO)
        
        local hasil_pencarian = -- (Fungsi untuk deteksi keberadaan Wild)
        
        if hasil_pencarian ~= nil then
            -- 2. Jika "Wild" ditemukan, lakukan 500x perkalian/aksi
            print("Wild ditemukan! Memulai aksi 500x...")
            
            for j = 1, 500 do
                -- Masukkan aksi perkalian/modifikasi di sini
                -- Contoh: gg.setValue(hasil_pencarian.address, nilai_baru)
            end
            
            print("Aksi 500x selesai.")
        else
            print("Wild tidak ditemukan pada iterasi ke-" .. i)
        end
        
        -- Delay untuk menjaga stabilitas sistem
        -- gg.sleep(100) 
    end
end

proses_otomatis()
