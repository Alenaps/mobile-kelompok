import 'package:flutter/material.dart';

class StatistikScreen extends StatelessWidget {
  const StatistikScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulasi data statistik
    final int totalPengguna = 150;
    final int totalMahasiswa = 120;
    final int totalPetugas = 30;
    final int laporanAktif = 45;
    final int laporanSelesai = 89;
    final int laporanTotal = 134;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Statistik',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            const Text(
              'Dashboard Statistik',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Ringkasan data sistem',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
            const SizedBox(height: 24),

            // Statistik Pengguna
            _buildSectionTitle('Statistik Pengguna', Icons.people_alt_outlined),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    'Total Pengguna',
                    totalPengguna.toString(),
                    Icons.people,
                    Colors.blueAccent,
                    onTap: () => _showDetailDialog(
                      context,
                      'Total Pengguna',
                      'Jumlah seluruh pengguna yang terdaftar di sistem',
                      totalPengguna,
                      Icons.people,
                      Colors.blueAccent,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    context,
                    'Mahasiswa',
                    totalMahasiswa.toString(),
                    Icons.school,
                    Colors.teal,
                    onTap: () => _showMahasiswaList(context),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildStatCard(
              context,
              'Petugas',
              totalPetugas.toString(),
              Icons.admin_panel_settings,
              Colors.orangeAccent,
              onTap: () => _showPetugasList(context),
            ),

            const SizedBox(height: 32),

            // Statistik Laporan
            _buildSectionTitle('Statistik Laporan', Icons.description_outlined),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    'Total Laporan',
                    laporanTotal.toString(),
                    Icons.description,
                    Colors.purpleAccent,
                    onTap: () => _showLaporanList(context, 'semua'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    context,
                    'Laporan Aktif',
                    laporanAktif.toString(),
                    Icons.pending_actions,
                    Colors.amber[700]!,
                    onTap: () => _showLaporanList(context, 'aktif'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            _buildStatCard(
              context,
              'Laporan Selesai',
              laporanSelesai.toString(),
              Icons.check_circle,
              Colors.green,
              onTap: () => _showLaporanList(context, 'selesai'),
            ),

            const SizedBox(height: 32),

            // Grafik Persentase
            _buildSectionTitle('Status Laporan', Icons.pie_chart_outline),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildPercentageBar(
                    'Selesai',
                    laporanSelesai,
                    laporanTotal,
                    Colors.green,
                  ),
                  const SizedBox(height: 16),
                  _buildPercentageBar(
                    'Dalam Proses',
                    laporanAktif,
                    laporanTotal,
                    Colors.amber[700]!,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Info Terakhir Diperbarui
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.update,
                      size: 16,
                      color: Colors.grey[600],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Terakhir diperbarui: ${_formatDateTime(DateTime.now())}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 22, color: Colors.black87),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color, {
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.15),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: color.withValues(alpha: 0.15),
                  radius: 24,
                  child: Icon(
                    icon,
                    color: color,
                    size: 26,
                  ),
                ),
                if (onTap != null)
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Colors.grey[400],
                  ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              value,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPercentageBar(
    String label,
    int value,
    int total,
    Color color,
  ) {
    double percentage = (value / total) * 100;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            Text(
              '${percentage.toStringAsFixed(1)}% ($value)',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: percentage / 100,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 14,
          ),
        ),
      ],
    );
  }

  void _showDetailDialog(
    BuildContext context,
    String title,
    String description,
    int value,
    IconData icon,
    Color color,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withValues(alpha: 0.15),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 12),
            Text(title),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              description,
              style: TextStyle(color: Colors.grey[600]),
            ),
            const SizedBox(height: 16),
            Text(
              'Total: $value',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  }

  void _showMahasiswaList(BuildContext context) {
    // Data dummy mahasiswa
    final List<Map<String, String>> mahasiswaList = [
      {'nama': 'Ahmad Fauzi', 'nim': '2021001', 'prodi': 'Teknik Informatika'},
      {'nama': 'Siti Nurhaliza', 'nim': '2021002', 'prodi': 'Sistem Informasi'},
      {'nama': 'Budi Santoso', 'nim': '2021003', 'prodi': 'Teknik Elektro'},
      {'nama': 'Dewi Lestari', 'nim': '2021004', 'prodi': 'Manajemen'},
      {'nama': 'Eko Prasetyo', 'nim': '2021005', 'prodi': 'Akuntansi'},
      {'nama': 'Fitri Handayani', 'nim': '2021006', 'prodi': 'Teknik Informatika'},
      {'nama': 'Gita Savitri', 'nim': '2021007', 'prodi': 'Sistem Informasi'},
      {'nama': 'Hendra Gunawan', 'nim': '2021008', 'prodi': 'Teknik Elektro'},
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.teal[50],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.teal.withValues(alpha: 0.15),
                    child: const Icon(Icons.school, color: Colors.teal),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daftar Mahasiswa',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Total: 120 Mahasiswa',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: mahasiswaList.length,
                itemBuilder: (context, index) {
                  final mahasiswa = mahasiswaList[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.teal[100],
                        child: Text(
                          mahasiswa['nama']![0],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal,
                          ),
                        ),
                      ),
                      title: Text(
                        mahasiswa['nama']!,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text('NIM: ${mahasiswa['nim']}'),
                          Text(
                            mahasiswa['prodi']!,
                            style: TextStyle(
                              color: Colors.teal[700],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey[400],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showPetugasList(BuildContext context) {
    // Data dummy petugas
    final List<Map<String, String>> petugasList = [
      {'nama': 'Achmad Waspodo', 'role': 'Admin Sistem', 'status': 'Aktif'},
      {'nama': 'Bambang Setiawan', 'role': 'Operator', 'status': 'Aktif'},
      {'nama': 'Citra Dewi', 'role': 'Supervisor', 'status': 'Aktif'},
      {'nama': 'Dedi Kurniawan', 'role': 'Operator', 'status': 'Nonaktif'},
      {'nama': 'Erna Wati', 'role': 'Admin', 'status': 'Aktif'},
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.orangeAccent.withValues(alpha: 0.15),
                    child: const Icon(
                      Icons.admin_panel_settings,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Daftar Petugas',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Total: 30 Petugas',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: petugasList.length,
                itemBuilder: (context, index) {
                  final petugas = petugasList[index];
                  final isAktif = petugas['status'] == 'Aktif';
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange[100],
                        child: Text(
                          petugas['nama']![0],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      ),
                      title: Text(
                        petugas['nama']!,
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          Text(petugas['role']!),
                          const SizedBox(height: 4),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: isAktif ? Colors.green[50] : Colors.red[50],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              petugas['status']!,
                              style: TextStyle(
                                color: isAktif ? Colors.green[700] : Colors.red[700],
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey[400],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLaporanList(BuildContext context, String tipe) {
    // Data dummy laporan
    final List<Map<String, dynamic>> laporanList = [
      {
        'judul': 'Kerusakan Kursi Ruang Kelas',
        'status': 'selesai',
        'tanggal': '10 Des 2024',
        'pelapor': 'Ahmad Fauzi'
      },
      {
        'judul': 'AC Tidak Dingin',
        'status': 'aktif',
        'tanggal': '11 Des 2024',
        'pelapor': 'Siti Nurhaliza'
      },
      {
        'judul': 'Lampu Mati di Koridor',
        'status': 'aktif',
        'tanggal': '12 Des 2024',
        'pelapor': 'Budi Santoso'
      },
      {
        'judul': 'Toilet Tersumbat',
        'status': 'selesai',
        'tanggal': '09 Des 2024',
        'pelapor': 'Dewi Lestari'
      },
      {
        'judul': 'Proyektor Rusak',
        'status': 'aktif',
        'tanggal': '13 Des 2024',
        'pelapor': 'Eko Prasetyo'
      },
    ];

    // Filter berdasarkan tipe
    List<Map<String, dynamic>> filteredList = laporanList;
    if (tipe == 'aktif') {
      filteredList = laporanList.where((l) => l['status'] == 'aktif').toList();
    } else if (tipe == 'selesai') {
      filteredList = laporanList.where((l) => l['status'] == 'selesai').toList();
    }

    String title = tipe == 'aktif'
        ? 'Laporan Aktif'
        : tipe == 'selesai'
            ? 'Laporan Selesai'
            : 'Semua Laporan';
    Color headerColor = tipe == 'aktif'
        ? Colors.amber[50]!
        : tipe == 'selesai'
            ? Colors.green[50]!
            : Colors.purple[50]!;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        expand: false,
        builder: (context, scrollController) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: headerColor,
                borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: tipe == 'aktif'
                        ? Colors.amber.withValues(alpha: 0.15)
                        : tipe == 'selesai'
                            ? Colors.green.withValues(alpha: 0.15)
                            : Colors.purple.withValues(alpha: 0.15),
                    child: Icon(
                      tipe == 'aktif'
                          ? Icons.pending_actions
                          : tipe == 'selesai'
                              ? Icons.check_circle
                              : Icons.description,
                      color: tipe == 'aktif'
                          ? Colors.amber[700]
                          : tipe == 'selesai'
                              ? Colors.green
                              : Colors.purpleAccent,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Total: ${filteredList.length} Laporan',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: filteredList.length,
                itemBuilder: (context, index) {
                  final laporan = filteredList[index];
                  final isSelesai = laporan['status'] == 'selesai';
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(16),
                      leading: CircleAvatar(
                        backgroundColor:
                            isSelesai ? Colors.green[100] : Colors.amber[100],
                        child: Icon(
                          isSelesai ? Icons.check_circle : Icons.pending,
                          color: isSelesai ? Colors.green : Colors.amber[700],
                        ),
                      ),
                      title: Text(
                        laporan['judul'],
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(Icons.person, size: 14, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Text(
                                laporan['pelapor'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(Icons.calendar_today,
                                  size: 14, color: Colors.grey[600]),
                              const SizedBox(width: 4),
                              Text(
                                laporan['tanggal'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: isSelesai ? Colors.green[50] : Colors.amber[50],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              isSelesai ? 'Selesai' : 'Dalam Proses',
                              style: TextStyle(
                                color:
                                    isSelesai ? Colors.green[700] : Colors.amber[700],
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Colors.grey[400],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'Mei',
      'Jun',
      'Jul',
      'Agu',
      'Sep',
      'Oct',
      'Nov',
      'Des'
    ];
    return '${dateTime.day} ${months[dateTime.month - 1]} ${dateTime.year}, ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }
}