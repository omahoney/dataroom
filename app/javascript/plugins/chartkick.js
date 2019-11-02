import Chartkick from 'chartkick';
import Chart from 'chart.js';

$(document).on('turbolinks:load', function() {
    window.Chartkick = Chartkick
    Chartkick.addAdapter(Chart)
    Chartkick.options = {
        library: {animation: {easing: 'easeOutQuart'}},
    }

    // Stockplans Dashboard
    const stockplanAuthorizedPieChart = $('#stockplanAuthorized-pie-chart')
    if (stockplanAuthorizedPieChart.length > 0) {
        let data = stockplanAuthorizedPieChart.data('stockplans')
        new Chartkick.ColumnChart('stockplanAuthorized-pie-chart', data)
    }

    const stockplanIssuablePieChart = $('#stockplanIssuable-pie-chart')
    if (stockplanIssuablePieChart.length > 0) {
        let data = stockplanIssuablePieChart.data('stockplans')
        new Chartkick.ColumnChart('stockplanIssuable-pie-chart', data)
    }

    const stockplanAuthorizedColumnChart = $('#stockplanAuthorized-column-chart')
    if (stockplanAuthorizedColumnChart.length > 0) {
        let data = stockplanAuthorizedColumnChart.data('stockplans')
        new Chartkick.ColumnChart('stockplanAuthorized-column-chart', data)
    }

    const stockplanIssuableColumnChart = $('#stockplanIssuable-column-chart')
    if (stockplanIssuableColumnChart.length > 0) {
        let data = stockplanIssuableColumnChart.data('stockplans')
        new Chartkick.ColumnChart('stockplanIssuable-column-chart', data)
    }

    const stockplanReservedColumnChart = $('#stockplanReserved-column-chart')
    if (stockplanReservedColumnChart.length > 0) {
        let data = stockplanReservedColumnChart.data('stockplans')
        new Chartkick.ColumnChart('stockplanReserved-column-chart', data)
    }

    // Shares Dashboard
    const shareOwnershipColumnChart = $('#shareOwnership-column-chart')
    if (shareOwnershipColumnChart.length > 0) {
        let data = shareOwnershipColumnChart.data('shares')
        new Chartkick.ColumnChart('shareOwnership-column-chart', data)
    }

    const shareOwnershipPieChart = $('#shareOwnership-pie-chart')
    if (shareOwnershipPieChart.length > 0) {
        let data = shareOwnershipPieChart.data('shares')
        new Chartkick.PieChart('shareOwnership-pie-chart', data)
    }

    const shareOutstandingColumnChart = $('#shareOutstanding-column-chart')
    if (shareOutstandingColumnChart.length > 0) {
        let data = shareOutstandingColumnChart.data('shares')
        new Chartkick.ColumnChart('shareOutstanding-column-chart', data)
    }


    // Shares Captable
    const shareOutstandingPieChart = $('#shareOutstanding-pie-chart')
    if (shareOutstandingPieChart.length > 0) {
        let data = shareOutstandingPieChart.data('shares')
        new Chartkick.PieChart('shareOutstanding-pie-chart', data)
    }


    const shareFullyDilutedPieChart = $('#shareFullyDiluted-pie-chart')
    if (shareFullyDilutedPieChart.length > 0) {
        let data = shareFullyDilutedPieChart.data('shares')
        new Chartkick.PieChart('shareFullyDiluted-pie-chart', data)
    }

    const shareFullyDilutedColumnChart = $('#shareFullyDiluted-column-chart')
    if (shareFullyDilutedColumnChart.length > 0) {
        let data = shareFullyDilutedColumnChart.data('shares')
        new Chartkick.ColumnChart('shareFullyDiluted-column-chart', data)
    }


    const shareOutstandingDateColumnChart = $('#shareOutstandingDate-column-chart')
    if (shareOutstandingDateColumnChart.length > 0) {
        let data = shareOutstandingDateColumnChart.data('shares')
        new Chartkick.ColumnChart('shareOutstandingDate-column-chart', data)
    }


    // Shares Newround
    const shareNewroundFullyDilutedPieChart = $('#shareNewroundFullyDiluted-pie-chart')
    if (shareNewroundFullyDilutedPieChart.length > 0) {
        let data = shareNewroundFullyDilutedPieChart.data('shares')
        new Chartkick.PieChart('shareNewroundFullyDiluted-pie-chart', data)
    }

    const shareDilutedPersonColumnChart = $('#shareDilutedPerson-column-chart')
    if (shareDilutedPersonColumnChart.length > 0) {
        let data = shareDilutedPersonColumnChart.data('shares')
        new Chartkick.ColumnChart('shareDilutedPerson-column-chart', data)
    }

    const shareSeriesColumnChart = $('#shareSeries-column-chart')
    if (shareSeriesColumnChart.length > 0) {
        let data = shareSeriesColumnChart.data('shares')
        new Chartkick.ColumnChart('shareSeries-column-chart', data)
    }

    const shareSeriesTerminatedColumnChart = $('#shareSeriesTerminated-column-chart')
    if (shareSeriesTerminatedColumnChart.length > 0) {
        let data = shareSeriesTerminatedColumnChart.data('shares')
        new Chartkick.ColumnChart('shareSeriesTerminated-column-chart', data)
    }

    // options/dashboard
    const optionOutstandingColumnChart = $('#optionOutstanding-column-chart')
    if (optionOutstandingColumnChart.length > 0) {
        let data = optionOutstandingColumnChart.data('options')
        new Chartkick.ColumnChart('optionOutstanding-column-chart', data)
    }

    const optionOutstandingPieChart = $('#optionOutstanding-pie-chart')
    if (optionOutstandingPieChart.length > 0) {
        let data = optionOutstandingPieChart.data('options')
        new Chartkick.PieChart('optionOutstanding-pie-chart', data)
    }

    const optionStatusPieChart = $('#optionStatus-pie-chart')
    if (optionStatusPieChart.length > 0) {
        let data = optionStatusPieChart.data('options')
        new Chartkick.PieChart('optionStatus-pie-chart', data)
    }

    const optionIssuablePieChart = $('#optionIssuable-pie-chart')
    if (optionIssuablePieChart.length > 0) {
        let data = optionIssuablePieChart.data('options')
        new Chartkick.PieChart('optionIssuable-pie-chart', data)
    }

    const convertiblenotePieChart = $('#convertiblenote-pie-chart')
    if (convertiblenotePieChart.length > 0) {
        let data = convertiblenotePieChart.data('converitblenotes')
        new Chartkick.PieChart('convertiblenote-pie-chart', data)
    }


    // Shares Captable

})







