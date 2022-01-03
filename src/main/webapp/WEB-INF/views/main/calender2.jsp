<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${path}/resources/css/bootstrap.css">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">회사이름</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-expanded="false">
						이름(조직) </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">로그아웃</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">설정</a>
					</div></li>
			</ul>
		</div>
	</nav>

	<template>
<div class="pa-5">
    <v-row>
        <v-col cols="12" md="6" class="mb-4">
            <v-row>
                <v-col cols="6">
                    <v-menu
                            ref="dateOpen"
                            v-model="dateOpen"
                            :close-on-content-click="false"
                            :return-value.sync="start"
                            offset-y
                    >
                        <template v-slot:activator="{ on }">
                            <v-text-field
                                    v-model="start"
                                    dark
                                    label="Start Date"
                                    prepend-icon="mdi-calendar"
                                    dense
                                    readonly
                                    outlined
                                    hide-details
                                    v-on="on"
                            ></v-text-field>
                        </template>

                        <v-date-picker dark
                                       v-model="start"
                                       no-title
                        >
                            <v-spacer/>
                            <v-btn text dark color="primary" @click="dateOpen = false">Cancel</v-btn>
                            <v-btn text dark color="primary" @click="$refs.dateOpen.save(start)">OK</v-btn>
                        </v-date-picker>
                    </v-menu>
                </v-col>
                <v-col cols="6">
                    <v-select
                            v-model="type"
                            :items="typeOptions"
                            label="Type"
                            class="my-auto"
                            dark
                            hide-details
                            outlined
                            dense
                    ></v-select>
                </v-col>
            </v-row>
            <v-sheet height="500">
                <v-calendar
                        ref="calendar"
                        :start="start"
                        :type="type"
                        dark
                ></v-calendar>
            </v-sheet>
        </v-col>
    </v-row>
</div>
</template>

<script>
export default {
    data() {
        return {
            dateOpen: false,
            start: '',
            type: 'month',
            typeOptions: [
                {text: 'Day', value: 'day'},
                {text: 'Week', value: 'week'},
                {text: 'Month', value: 'month'},
            ],
        }
    },
}
</script>

	<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>