<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="admindeshboard.aspx.cs" Inherits="Patient_Feedback.admindeshboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <style>
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }

        .sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            background-color: pink; /* Pink color for the sidebar */
            color: #333;
            padding: 20px;
        }

        .sidebar header {
            font-size: 1.5em;
            margin-bottom: 20px;
            color: white; /* Make header text white */
        }

        .sidebar a {
            display: block;
            color: white; /* Sidebar link color white */
            padding: 10px;
            text-decoration: none;
        }

        .sidebar a:hover {
            background-color: #ffc0cb; /* Lighter pink hover effect */
        }

        .content {
            margin-left: 250px; /* Matches the width of the sidebar */
            padding: 20px;
        }

        .chart-container {
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            transition: transform 0.2s ease-in-out;
        }

        .chart-container:hover {
            transform: scale(1.02);
        }

        .chart-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #495057;
        }

        .table-responsive {
            overflow-x: auto;
        }

        .table th {
            background-color: #007bff;
            color: white;
        }
    </style>

    <div class="sidebar">
        <header>Dashboard</header>
        <a href="#">Users List</a>
        <a href="#">Reports</a>
    </div>

    <div class="content">
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-6">
                    <div class="chart-container">
                        <h2>Outpatients vs. Inpatients Trend</h2>
                        <canvas id="barChart"></canvas>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="chart-container">
                        <h2>Overall Patient Satisfaction</h2>
                        <canvas id="pieChart"></canvas>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="chart-container">
                        <h2>Patients by Division</h2>
                        <canvas id="divisionChart"></canvas>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="chart-container">
                        <h2>Avg Waiting Time by Division</h2>
                        <canvas id="waitingTimeChart"></canvas>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="chart-container">
                        <h2>Diagnosis Satisfaction</h2>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Answer Choices</th>
                                        <th>Responses</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Medicare Phase 1</td>
                                        <td>Yes: 92.9% (693), No: 7.1% (53)</td>
                                    </tr>
                                    <tr>
                                        <td>Medicare JLN Road</td>
                                        <td>Yes: 97.53% (1421), No: 2.47% (36)</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-6 pie-chart-col">
                                <canvas id="diagnosisChart1"></canvas>
                            </div>
                            <div class="col-md-6 pie-chart-col">
                                <canvas id="diagnosisChart2"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        // Define chart colors
        const chartColors = {
            blue: '#007bff',
            green: '#28a745',
            yellow: '#ffc107',
            red: '#dc3545',
            gray: '#6c757d',
            lightGray: '#f1f1f1',
        };

        // Outpatients vs Inpatients Bar Chart
        const barChart = new Chart(document.getElementById('barChart'), {
            type: 'bar',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                datasets: [
                    {
                        label: 'Outpatients',
                        data: [1200, 1700, 1500, 1800, 2100, 2500, 2200],
                        backgroundColor: chartColors.blue
                    },
                    {
                        label: 'Inpatients',
                        data: [800, 1200, 1100, 1400, 1600, 1900, 1700],
                        backgroundColor: chartColors.gray
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });

        // Overall Patient Satisfaction Pie Chart
        const pieChart = new Chart(document.getElementById('pieChart'), {
            type: 'pie',
            data: {
                labels: ['Positive', 'Neutral', 'Negative'],
                datasets: [
                    {
                        data: [80, 15, 5],
                        backgroundColor: [chartColors.green, chartColors.yellow, chartColors.red]
                    }
                ]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        position: 'bottom'
                    }
                }
            }
        });

        // Patients by Division Chart
        const divisionChart = new Chart(document.getElementById('divisionChart'), {
            type: 'bar',
            data: {
                labels: ['Cardiology', 'Neurology', 'Surgery', 'Orthopedics'],
                datasets: [
                    {
                        label: 'Patients',
                        data: [3000, 2500, 3200, 2800],
                        backgroundColor: chartColors.blue
                    }
                ]
            },
            options: {
                responsive: true,
                scales: {
                    y: { beginAtZero: true }
                }
            }
        });

        // Avg Waiting Time by Division Chart
        const waitingTimeChart = new Chart(document.getElementById('waitingTimeChart'), {
            type: 'bar',
            data: {
                labels: ['Cardiology', 'Gynecology', 'Neurology', 'Orthopedics', 'Surgery'],
                datasets: [
                    {
                        label: 'Waiting Time',
                        data: [30, 45, 25, 40, 35],
                        backgroundColor: chartColors.yellow
                    }
                ]
            },
            options: {
                responsive: true,
                indexAxis: 'y',
                scales: {
                    x: { beginAtZero: true }
                }
            }
        });

        // Diagnosis Satisfaction Pie Charts
        const diagnosisChart1 = new Chart(document.getElementById('diagnosisChart1'), {
            type: 'pie',
            data: {
                labels: ['Yes', 'No'],
                datasets: [
                    {
                        data: [693, 53],
                        backgroundColor: [chartColors.green, chartColors.red]
                    }
                ]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'bottom' }
                }
            }
        });

        const diagnosisChart2 = new Chart(document.getElementById('diagnosisChart2'), {
            type: 'pie',
            data: {
                labels: ['Yes', 'No'],
                datasets: [
                    {
                        data: [1421, 36],
                        backgroundColor: [chartColors.green, chartColors.red]
                    }
                ]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { position: 'bottom' }
                }
            }
        });
    </script>

</asp:Content>
